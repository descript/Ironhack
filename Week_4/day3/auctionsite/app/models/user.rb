class User < ApplicationRecord
  has_many :products
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
