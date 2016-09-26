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
      new_ingredients.each do |ingredient|
        if !ingredient.key?('id')
          Ingredient.create(name: ingredient[:name], kitchen_list_id: 1, category_id: 1)
        end
      end

      not_deleted = []
      still_there = []
      deleted = []

      new_ingredients.each do |ingred|
        still_there << ingred[:id]
      end

      orig_ingredients.each do |orig|
        if still_there.include?(orig.id)
          not_deleted << orig
        else
          deleted << orig
          orig.destroy
        end
      end

#Refactor using reject method to make more DRY

      @ingredients = current_api_user.kitchen_list.ingredients
      render json: @ingredients.as_json
    end

  end
end
