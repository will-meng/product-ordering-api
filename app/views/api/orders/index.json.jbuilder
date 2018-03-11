@orders.each do |order|
  json.set! order.id do
    json.extract! order, :id, :status
    json.products order.order_items do |item|
      json.extract! item.product, :id, :name
      json.extract! item, :number_purchased
    end
  end
end