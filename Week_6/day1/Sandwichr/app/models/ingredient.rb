class Ingredient < ApplicationRecord
  has_many :sandwiches_ingredients
  has_many :sandwiches, through: :sandwiches_ingredients
end
