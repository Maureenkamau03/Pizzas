class RestaurantPizzasController < ApplicationController
  skip_before_action :verify_authenticity_token
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_method
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  
  #Get all t
  def index
    restaurantpizza = RestaurantPizza.all
    render json: restaurantpizza
  end
  # #GET 
  def show
    restaurantpizza = RestaurantPizza.find_by(id: params[:id])
    render json: restaurantpizza
  end
  #POST 
  def create
    restaurantpizza = RestaurantPizza.create!(restaurant_pizza_params)
    render json: restaurantpizza, status: :created
    
  end
  
  # def destroy
  #   restaurantpizza = RestaurantPizza.find_by(id: params[:id])
  #   RestaurantPizza.destroy
  #   render json: restaurantpizza, status: :no_content
  # end
  
  private
  # params
  def restaurant_pizza_params
      params.permit(:price, :pizza_id, :restaurant_id)
  end
  # error
  def record_not_found
    render json: {error: "RestaurantPizza Not Found"}, status: :not_found
  end
  
  def unprocessable_entity_method entity
      render json: {errors: entity.record.errors}, status: :unprocessable_entity
  end
end
