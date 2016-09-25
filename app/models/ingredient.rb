class Ingredient < ActiveRecord::Base
  belongs_to :kitchen_list
  belongs_to :category
end