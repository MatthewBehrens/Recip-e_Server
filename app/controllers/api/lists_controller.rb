module Api
  class ListsController < ApplicationController
    before_action :authenticate_api_user!
    respond_to :json

    def show
      @user = current_api_user
      @ingredients = @user.kitchen_list.ingredients

      render json: @ingredients.as_json
    end

    def add

    end

    def remove

    end

    def save
      orig_ingredients = current_api_user.ingredients
      new_ingredients = params[:list][:ingredients]
      persisted = []

      #Save new ingredients
      new_ingredients.each do |ingredient|
        if !ingredient.key?('id')
          Ingredient.create(name: ingredient[:name], kitchen_list_id: 1, category_id: 1)
        end
      end

      #Pull out IDs of 'unpersisted' ingredients coming back from client
      new_ingredients.each do |ingred|
        persisted << ingred[:id]
      end

      #If ID isn't there then delete the persisted ingredient form original ingredients
      orig_ingredients.each do |orig|
        if !persisted.include?(orig.id)
          orig.destroy
        end
      end

      #Could refactor using reject method to make more DRY

      @ingredients = current_api_user.ingredients
      render json: @ingredients.as_json
    end

  end
end
