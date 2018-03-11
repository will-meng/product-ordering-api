json.array! @data do |datum|
  json.customer_id datum.customer_id
  json.customer_first_name datum.customer_first_name
  json.category_id datum.category_id
  json.category_name datum.category_name
  json.number_purchased datum.number_purchased
end