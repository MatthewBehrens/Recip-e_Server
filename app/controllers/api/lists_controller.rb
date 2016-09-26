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
      orig_ingredients = current_api_user.kitchen_list.ingredients
      new_ingredients = params[:list][:ingredients]
      new_ingredients.each do |ingredient|
        if !ingredient.key?('id')
          Ingredient.create(name: ingredient[:name], kitchen_list_id: 1, category_id: 1)
        end
    end
p '*******************'
      p orig_ingredients
      p '*******************'
      p new_ingredients[0].class
      p new_ingredients[0][:name]
      still_there = []
      deleted = []

      # orig_ingredients.each do |old|
      #   new_ingredients.each do |newest|
      #    if old.name == newest[:name]

      #    end
      # end


      @user = current_api_user
      @ingredients = @user.kitchen_list.ingredients
      render json: @ingredients.as_json
    end

  end
end
