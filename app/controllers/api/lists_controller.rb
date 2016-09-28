module Api
  class ListsController < ApplicationController
    before_action :authenticate_api_user!
    respond_to :json

    def show


      if !current_api_user.kitchen_list
        list = KitchenList.new(user: current_api_user)
        list.save
      end
      dairy = Category.find_by(name: 'Dairy')
      produce = Category.find_by(name: 'Produce')
      beverages = Category.find_by(name: 'Beverages')
      meat = Category.find_by(name: 'Meat')
      bakery = Category.find_by(name: 'Bakery')
      pantry = Category.find_by(name: 'Pantry')
      frozen = Category.find_by(name: 'Frozen')




      @ingredients = current_api_user.ingredients
      render json: @ingredients.as_json
    end

    def add

    end

    def remove

    end

    def save
      client_ingredients = params[:list][:ingredients]
      server_ingredients = current_api_user.ingredients
      persisted = []

      #Pull out IDs of 'unpersisted' ingredients coming back from client
      client_ingredients.each do |ingred|
        persisted << ingred[:id]
      end

      #If ID isn't there then delete the persisted ingredient form original ingredients
      server_ingredients.each do |orig|
        if !persisted.include?(orig.id)
          orig.destroy
        end
      end

      #Save new ingredients
      client_ingredients.each do |ingredient|
        if !ingredient.key?('id')
          Ingredient.create(name: ingredient[:name], kitchen_list: current_api_user.kitchen_list, category_id: ingredient[:category_id].to_i)
        # elsif ingredient.key('category')
        else
          persisted << ingredient[:id]
        end
      end
      @ingredients = current_api_user.ingredients
      render json: @ingredients.as_json
    end

  end
end
