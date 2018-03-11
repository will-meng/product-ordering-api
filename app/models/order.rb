class Order < ApplicationRecord
  validates :status, presence: true, 
    inclusion: { in: ['waiting for delivery', "on it's way", 'delivered'] }

  belongs_to :customer
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items
  has_many :categories, through: :products
end
