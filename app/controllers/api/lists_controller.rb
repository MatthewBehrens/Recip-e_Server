module Api
  class ListsController < ApplicationController
    respond_to :json

    def show
      @user = User.find(1)
      @list = @user.kitchen_list
      @ingredients = @user.kitchen_list.ingredients
      @categories = Category.all
      render json: @ingredients.as_json
    end

    def add

    end

    def remove

    end

    def save
      params[:list][:ingredients].each do |ingredient|
        if !ingredient.key?('id')
          p true
          Ingredient.create(name: ingredient[:name], kitchen_list_id: 1, category_id: 1)
        end
      end
      @user = User.find(1)
      @ingredients = @user.kitchen_list.ingredients
      render json: @ingredients.as_json
    end


  end
end
