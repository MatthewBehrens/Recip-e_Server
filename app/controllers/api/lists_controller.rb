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
      # p "Entered the save route"
      # p "--------------------------------------------------"
      saved_ingredients = current_api_user.kitchen_list.ingredients
      params[:ingredients].each do |passed_ingredient|
        # p "#{passed_ingredient["name"]}:  #{saved_ingredients.any? {|h| h["name"] == passed_ingredient["name"]}}"
        if !passed_ingredient.key?('id')
          Ingredient.create(name: passed_ingredient[:name], kitchen_list_id: 1, category_id: 1)
        end
      end
      @user = current_user
      @ingredients = @user.kitchen_list.ingredients
      render json: @ingredients.as_json
    end


  end
end
