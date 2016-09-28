class FavoriteRecipe < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :api_recipe_id, presence: true
  validates_uniqueness_of :api_recipe_id, scope: :user_id
end
