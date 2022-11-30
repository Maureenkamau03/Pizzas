class SingleRestaurantPizzaSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :pizzas
end
