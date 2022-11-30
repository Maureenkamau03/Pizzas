class RestaurantpizzasController < ApplicationController
end
aclass RestaurantPizzasController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_method
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

#Get all the restaurant_pizzas
def index
  restaurant_pizza = RestaurantPizza.all
  render json: restaurantPizza
end
#GET 
def show
  restaurant_pizza = RestaurantPizza.find_by!(id: params[:id])
  render json: restaurant_pizza
end
#POST 
def create
    restaurant_pizza = RestaurantPizza.create!(restaurant_pizza_params)
    render json: restaurant_pizza, status: :created
end



private

def restaurant_pizza_params
    params.permit(:price, :pizza_id, :restaurant_id)
end
def record_not_found
  render json: {error: "RestaurantPizza Not Found"}, status: :not_found
end

def unprocessable_entity_method entity
    render json: {errors: entity.record.errors}, status: :unprocessable_entity
end



