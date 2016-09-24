class KitchenList < ActiveRecord::Base
  belongs_to :user
  has_many :ingredients
  has_many :categories, through: :ingredients
end