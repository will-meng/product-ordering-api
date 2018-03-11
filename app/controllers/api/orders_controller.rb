class Api::OrdersController < ApplicationController
  def index
    @customer = Customer.find_by(id: params[:id])

    if @customer
      @orders = @customer.orders_with_products
      render :index
    else
      render json: ['Customer not found'], status: 404
    end
  end
end
