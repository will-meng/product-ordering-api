json.array! @orders do |order|
  json.order_id order.id
  json.order_date order.created_at.to_date
  json.status order.status
  json.products order.order_items do |item|
    json.product_id item.product.id
    json.product_name item.product.name
    json.extract! item, :number_purchased
  end
end