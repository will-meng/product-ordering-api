class Customer < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true

  has_many :orders, dependent: :destroy
  has_many :order_items, through: :orders
  has_many :products, through: :order_items
  has_many :categories, through: :products

  def orders_with_products
    Customer.includes(orders: { order_items: :product })
      .where(id: self.id)
      .first 
      .orders
  end

  def number_purchased_by_category
    self.class.number_purchased_by_category(self.id)
  end

  def self.number_purchased_by_category(customer_id = nil)
    data = Customer.joins(:categories)
      .select('customers.id as customer_id, 
               customers.first_name as customer_first_name, 
               categories.id as category_id, 
               categories.name as category_name,
               SUM(order_items.number_purchased) as number_purchased'
             )
      .group('customers.id, categories.id')
      .order('customers.id, categories.id')

    customer_id ? data.where(id: customer_id) : data
  end

  def self.number_purchased_by_category_raw_sql
    Customer.connection.select_all(<<-SQL)
      SELECT
        customers.id, 
        customers.first_name, 
        categories.id, 
        categories.name, 
        SUM(order_items.number_purchased)
      FROM
        customers
      JOIN
        orders ON customers.id = orders.customer_id
      JOIN
        order_items ON orders.id = order_items.order_id
      JOIN
        products ON order_items.product_id = products.id
      JOIN
        categories ON products.category_id = categories.id
      GROUP BY
        customers.id, categories.id
      ORDER BY
        customers.id, categories.id
    SQL
  end
end
