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
      ingredients = current_api_user.kitchen_list.ingredients
      params[:list][:ingredients].each do |ingredient|
        if !ingredient.key?('id')
          Ingredient.create(name: ingredient[:name], kitchen_list_id: current_api_user.kitchen_list, category_id: ingredient[:category_id].to_i)
        end
      end
      @user = current_user
      @ingredients = @user.kitchen_list.ingredients
      render json: @ingredients.as_json
    end


  end
end
