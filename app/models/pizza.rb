class Pizza < ApplicationRecord
  has_many :restaurant_pizzas
  has_many :resaurants, through: :restaurant_pizzas
end
