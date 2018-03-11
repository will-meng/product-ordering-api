class OrderItem < ApplicationRecord
  validates :number_purchased, :product_id, :order_id, presence: true

  belongs_to :order
  belongs_to :product
end
