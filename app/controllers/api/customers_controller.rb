class Api::CustomersController < ApplicationController

  def number_purchased_by_category_all
    @data = Customer.number_purchased_by_category
    render :number_purchased_by_category
  end

  def number_purchased_by_category
    @customer = Customer.find_by(id: params[:id])

    if @customer
      @data = @customer.number_purchased_by_category
      render :number_purchased_by_category
    else
      render json: ['Cannot find that customer'], status: 404
    end
  end
end
