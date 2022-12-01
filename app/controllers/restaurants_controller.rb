class RestaurantsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_method
  skip_before_action :verify_authenticity_token

  #GET all Restaurants
  def index
      render json: Restaurant.all, each_serializer: RestaurantSerializer, status: :ok
  end

  # GET restaurant/:id
  def show
      restaurant =Restaurant.find_by!(id: params[:id])

      render json: restaurant, serializer: SingleRestaurantPizzaSerializer, status: :ok
  end

  # POST restaurant
  def create
      restaurant = Restaurant.create!(restaurant_params)
      render json: restaurant, status: :created
  end

  # PATCH
  def update
      restaurant =Restaurant.find_by!(id: params[:id])

      restaurant.update!(restaurant_params)
      render json: restaurant, status: :accepted
  end

  # DELETE
  def destroy
      restaurant = Restaurant.find_by(id: params[:id])
      restaurant.destroy
      render json: restaurant, status: :no_content
  end

  private


  def restaurant_params
      params.permit(:name, :ingredients)
  end

  def record_not_found
      render json: {error: "Restaurant Not Found"}, status: :not_found
  end

  def unprocessable_entity_method entity
      render json: {error: entity.record.errors}, status: :unprocessable_entity
  end
end
