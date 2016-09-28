module ApplicationHelper
  def spoonacular_api
    api ||= Spoonacular::API.new(ENV["SPOONACULAR_API_KEY"])
  end

  def recipe_is_favorited?(recipe_id)
    FavoriteRecipes.exist?(user_id: current_api_user.id, api_recipe_id: recipe_id)
  end
end
