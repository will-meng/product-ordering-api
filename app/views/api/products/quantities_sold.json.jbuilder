json.start_date @start_date
json.end_date @end_date
json.interval @interval
json.set! "total_#{@interval}s", @total_time
json.products @products do |product|
  json.extract! product, :id, :name, :quantity
end