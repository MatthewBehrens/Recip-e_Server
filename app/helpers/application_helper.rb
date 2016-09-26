module ApplicationHelper
  def spoonacular_api
    api ||= Spoonacular::API.new(ENV["SPOONACULAR_API_KEY"])
  end
end
