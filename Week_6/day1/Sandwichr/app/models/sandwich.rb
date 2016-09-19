class Sandwich < ApplicationRecord
  has_many :sandwiches_ingredients
  has_many :ingredients, through: :sandwiches_ingredients

  validates :name, presence: true, length: {minimum: 3, maximum: 255}
end
