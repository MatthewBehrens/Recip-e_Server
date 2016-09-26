module Api
  class ListsController < ApplicationController
    before_action :authenticate_api_user!
    respond_to :json

    def show
      @user = current_api_user
      if !@user.kitchen_list
        KitchenList.new(user: @user)
      end
      @ingredients = @user.kitchen_list.ingredients
      render json: @ingredients.as_json
    end

    def add

    end

    def remove

    end

    def save
      params_ingredients = params[:list][:ingredients]
      orig_ingredients = current_api_user.ingredients
      persisted = []

      #Pull out IDs of 'unpersisted' ingredients coming back from client
      params_ingredients.each do |ingred|
        persisted << ingred[:id]
      end

      #If ID isn't there then delete the persisted ingredient form original ingredients
      orig_ingredients.each do |orig|
        if !persisted.include?(orig.id)
          orig.destroy
        end
      end

      #Save new ingredients
      params_ingredients.each do |ingredient|
        if !ingredient.key?('id')
          Ingredient.create(name: ingredient[:name], kitchen_list_id: 1, category_id: 1)
        else
          persisted << ingredient[:id]
        end
      end

      @ingredients = current_api_user.ingredients
      render json: @ingredients.as_json
    end

  end
end
