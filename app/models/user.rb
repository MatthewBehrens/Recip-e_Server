class User < ActiveRecord::Base
  has_many :favorite_recipes
  has_one :kitchen_list
  has_many :ingredients, through: :kitchen_list

  validates :email, :presence => true, :uniqueness => true

end
