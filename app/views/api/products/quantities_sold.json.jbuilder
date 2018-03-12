json.start_date @start_date
json.end_date @end_date
json.interval @interval
json.set! "total_#{@interval}s", @total_time
json.products @products do |product|
  json.product_id product.id
  json.product_name product.name
  json.extract! product, :quantity
end