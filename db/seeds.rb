# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "seeding...🌱️"
Restaurant.destroy_all
Pizza.destroy_all
RestaurantPizza.destroy_all

# seeding restaurants
5.times do
    Restaurant.create(
        name: Faker::Restaurant.name,
        address: Faker::Address.full_address
    )
end
# seeding pizzas
Pizza.create([
  {
    name: "Pepperoni",
    ingredients: "Dough, Tomato Sauce, Cheese, Pepperoni"
  },
  {
    name: "Cheese",
    ingredients: "Dough, Tomato Sauce, Cheese"
  },
  {
    name: "Chicken",
    ingredients: "cheese, chillies, onion, garlic sauce, chunks of chicken"
  },
  {
    name: "Wholegrain",
    ingredients: "whole wheat flour, tomato sauce, mushrooms, cheese"
  }
])

# seeding join table pizza-restaurant
RestaurantPizza.create([
  {restaurant_id: 1, pizza_id: 1, price: rand(1..30)},
  {restaurant_id: 4, pizza_id: 2, price: rand(1..30)},
  {restaurant_id: 5, pizza_id: 4, price: rand(1..30)},
  {restaurant_id: 3, pizza_id: 5, price: rand(1..30)},
  {restaurant_id: 2, pizza_id: 3, price: rand(1..30)},
  ])


puts "Done seeding ⌛️"