class Api::ProductsController < ApplicationController

  def quantities_sold
    @start_date, @end_date, @interval, errors = 
      Product.quantities_sold_errors(
        params[:start_date], 
        params[:end_date], 
        params[:interval]
      )

    if errors.empty?
      @products, @total_time = 
        Product.quantities_sold(@start_date, @end_date, @interval)

      respond_to do |format|
        format.json { render :quantities_sold }
        format.csv { 
          send_data Product.quantities_sold_csv(
            @start_date, @end_date, @interval, @products, @total_time
          ), 
          filename: "products_sold_by_#{@interval}_from_#{@start_date}_to_#{@end_date}.csv" 
        }
      end
    else
      render json: errors, status: 422
    end
  end

end
