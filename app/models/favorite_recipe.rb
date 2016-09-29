class FavoriteRecipe < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :api_recipe_id, presence: true
  validates_uniqueness_of :api_recipe_id, scope: :user_id

  def self.recipe_is_favorited?(recipe_id, current_api_user)
    self.exists?(user_id: current_api_user.id, api_recipe_id: recipe_id)
  end
end
