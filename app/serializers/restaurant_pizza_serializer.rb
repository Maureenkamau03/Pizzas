class RestaurantPizzaSerializer < ActiveModel::Serializer
  attributes :price, :pizza_id, :restaurant_id
  
  # belongs_to :pizza
  # belongs_to :restaurant
end
