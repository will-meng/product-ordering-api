# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

c1 = Customer.create(email: 'alice@gmail.com', first_name: 'alice', last_name: 'doe')
c2 = Customer.create(email: 'bob@gmail.com', first_name: 'bob', last_name: 'doe')

cat1 = Category.create(name: 'food')
cat2 = Category.create(name: 'toys')
cat3 = Category.create(name: 'clothing')

p1 = Product.create(name: 'Big Mac', category_id: cat1.id)
p2 = Product.create(name: 'French Fries', category_id: cat1.id)
p3 = Product.create(name: 'Hulk Figure', category_id: cat2.id)
p4 = Product.create(name: "Rubik's Cube", category_id: cat2.id)
p5 = Product.create(name: "Tinfoil Hat", category_id: cat3.id)
p6 = Product.create(name: "Prophetic Spectacle", category_id: cat3.id)

o1 = Order.create(status: 'waiting for delivery', customer_id: c1.id, created_at: '2018-02-01')
o2 = Order.create(status: 'on its way', customer_id: c2.id, created_at: '2018-02-10')
o3 = Order.create(status: 'delivered', customer_id: c1.id, created_at: '2018-02-21')

OrderItem.create(number_purchased: 3, product_id: p1.id, order_id: o1.id, created_at: o1.created_at)
OrderItem.create(number_purchased: 2, product_id: p2.id, order_id: o1.id, created_at: o1.created_at)
OrderItem.create(number_purchased: 5.5, product_id: p3.id, order_id: o1.id, created_at: o1.created_at)

OrderItem.create(number_purchased: 15, product_id: p1.id, order_id: o2.id, created_at: o2.created_at)
OrderItem.create(number_purchased: 1, product_id: p2.id, order_id: o2.id, created_at: o2.created_at)
OrderItem.create(number_purchased: 3.4, product_id: p4.id, order_id: o2.id, created_at: o2.created_at)

OrderItem.create(number_purchased: 1, product_id: p4.id, order_id: o3.id, created_at: o3.created_at)
OrderItem.create(number_purchased: 0.5, product_id: p5.id, order_id: o3.id, created_at: o3.created_at)
OrderItem.create(number_purchased: 3.3, product_id: p6.id, order_id: o3.id, created_at: o3.created_at)