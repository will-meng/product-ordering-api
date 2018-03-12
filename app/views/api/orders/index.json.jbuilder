json.array! @orders do |order|
  json.order_id order.id
  json.status order.status
  json.products order.order_items do |item|
    json.product_id item.product.id
    json.product_name item.product.name
    json.extract! item, :number_purchased
  end
end