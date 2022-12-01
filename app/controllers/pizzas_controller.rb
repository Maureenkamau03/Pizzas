class PizzasController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_method
  skip_before_action :verify_authenticity_token
      # GET all 
      def index
        pizza = Pizza.all
        render json: pizza, each_serializer: PizzaSerializer
      end
  
      def show
        pizza = Pizza.find_by(id: params[:id])
        render json: pizza
      end
  
      private
  
      def record_not_found
        render json:{error: "Pizza not found"}, status: :not_found
      end
  end
  
  