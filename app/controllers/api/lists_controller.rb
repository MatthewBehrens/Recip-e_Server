module Api
  class ListsController < ApplicationController
    respond_to :json

    def show
      @user = User.find(1)
      @list = @user.kitchen_list
      @ingredients = @user.kitchen_list.ingredients

      render json: @ingredients.as_json
    end


  end
end
