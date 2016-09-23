module Api
  class RecipesController < ApplicationController
    respond_to :json
    def all

      # Make sure to downcase
      # ingredients_list = params["ingredients"]
      api = Spoonacular::API.new(ENV["SPOONACULAR_API_KEY"])
      # if Rails.cache.read(ingredients_list)
      #   response = Rails.cache.read(ingredients_list)
      # else
      #   # make the API Call
      #   # response = api.find_by_ingredients(ingredients_list)
      #   # Save response to the cache
      #   # Rails.cache.write(ingredients_list,response)
      # end

      # p 'This is what the api instance looks like:::::::'
      # response = api.find_by_ingredients('chicken tomatoes')

      render json: {"hello"=> "World"}
    end
  end
end

