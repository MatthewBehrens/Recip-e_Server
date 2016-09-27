module Api
  class RecipesController < ApplicationController
    before_action :authenticate_api_user!
    respond_to :json

    def remove_favorite
      recipe = FavoriteRecipe.where("user_id = ? AND api_recipe_id = ?", current_api_user, params["recipe_id"])
      FavoriteRecipe.destroy(recipe)
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
        p list_of_ids
        list_of_ids.each do |api_id|
          array_of_recipes << spoonacular_api.get_product_information(api_id)
        end
        response = array_of_recipes
      end

      render json: response
    end

    def ingredients_search
      #Clean up the incoming ingredients so that we can send a clean api request
      #Downcase
      downcase_ingredients = params["ingredients"].map {|item| item.downcase}
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


    def all

      render json: {body: [
                      {
                      id: 649495,
                      title: "Lemon and Garlic Slow Roasted Chicken",
                      image: "https://spoonacular.com/recipeImages/Lemon-and-Garlic-Slow-Roasted-Chicken-649495.jpg",
                      imageType: "jpg",
                      usedIngredientCount: 1,
                      missedIngredientCount: 2,
                      likes: 1
                      },
                      {
                      id: 640803,
                      title: "Crispy Buttermilk Fried Chicken",
                      image: "https://spoonacular.com/recipeImages/Crispy-Buttermilk-Fried-Chicken-640803.jpg",
                      imageType: "jpg",
                      usedIngredientCount: 1,
                      missedIngredientCount: 2,
                      likes: 53
                      },
                      {
                      id: 634485,
                      title: "Bbq Chicken Pizza",
                      image: "https://spoonacular.com/recipeImages/Bbq-Chicken-Pizza-634485.jpg",
                      imageType: "jpg",
                      usedIngredientCount: 1,
                      missedIngredientCount: 2,
                      likes: 1
                      },
                      {
                      id: 715525,
                      title: "Slow Cooker Rosemary Whole Chicken",
                      image: "https://spoonacular.com/recipeImages/slow-cooker-rosemary-whole-chicken-715525.jpg",
                      imageType: "jpg",
                      usedIngredientCount: 1,
                      missedIngredientCount: 3,
                      likes: 991
                      },
                      {
                      id: 634463,
                      title: "Batter Fried Chicken",
                      image: "https://spoonacular.com/recipeImages/Batter-Fried-Chicken-634463.jpg",
                      imageType: "jpg",
                      usedIngredientCount: 1,
                      missedIngredientCount: 3,
                      likes: 8
                      }
                      ]}
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
            Rails.cache.write(recipe_id,response)
         end
      end
      render json: response
    end
  end
end
