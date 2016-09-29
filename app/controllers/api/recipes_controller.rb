module Api
  class RecipesController < ApplicationController
    before_action :authenticate_api_user!
    respond_to :json

    def add_favorite
      new_fav = FavoriteRecipe.new(user: current_api_user, api_recipe_id: params[:recipe_id])
      if new_fav.save
        "Record Saved!"
      else
        new_fav.errors.full_messages
      end
    end

    def remove_favorite
      recipe = FavoriteRecipe.where("user_id = ? AND api_recipe_id = ?", current_api_user.id, params["recipe_id"])
      FavoriteRecipe.destroy_all(recipe)
      self.favorites
    end

    def favorites
      favorite_recipes = User.find(current_api_user).favorite_recipes
      # Make an array containing all the api recipe ids.
      list_of_ids = []
      favorite_recipes.each do |recipe|
        list_of_ids << recipe.api_recipe_id
      end

      if list_of_ids.empty?
        response = ""
      else
        # construct an array of recipes to return as a json object.
        array_of_recipes = []
        list_of_ids.each do |api_id|
          array_of_recipes << spoonacular_api.get_recipe_information(api_id)
        end
        response = array_of_recipes
      end

      render json: response
    end

    def ingredients_search
      #Clean up the incoming ingredients so that we can send a clean api request
      #Downcase

      downcase_ingredients = params["ingredients"].map {|ingred_obj| ingred_obj.downcase}
      #Remove blanks, this validation should be done client side as well
      ingredients_list = downcase_ingredients.reject { |c| c.empty? }

      if ingredients_list.empty?
        response = {error: "No ingredients passed, please input ingredients"}
      else
         if Rails.cache.read(ingredients_list)
            response = Rails.cache.read(ingredients_list)
         else
            response = spoonacular_api.find_by_ingredients(ingredients_list, "number=30&ranking=2")
            Rails.cache.write(ingredients_list,response)
         end
      end

      render json: response
    end

    def show
      recipe_id = params["id"]
      if (recipe_id == nil)
        response = {error: "No ID passed"}
      else
         if Rails.cache.read(recipe_id)
            response = Rails.cache.read(recipe_id)
         else
            response = spoonacular_api.get_recipe_information(recipe_id)
            Rails.cache.write(recipe_id, response)
         end
      end
      render json: response
    end

    def instructions
      id = params["id"]
      response = Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/#{id}/analyzedInstructions",
      headers:
      {
        "X-Mashape-Key" => ENV["SPOONACULAR_API_KEY"],
        "Accept" => "application/json"
      }
      render json: response
    end
  end
end
