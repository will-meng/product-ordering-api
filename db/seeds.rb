# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

c1 = Customer.create(email: 'a@b.com', first_name: 'john', last_name: 'doe')
c2 = Customer.create(email: 'b@c.com', first_name: 'jane', last_name: 'doe')

cat1 = Category.create(name: 'food')
cat2 = Category.create(name: 'toys')

p1 = Product.create(name: 'Big Mac', category_id: cat1.id)
p2 = Product.create(name: 'Hulk Figure', category_id: cat2.id)
p3 = Product.create(name: 'French Fries', category_id: cat1.id)
p4 = Product.create(name: "Rubik's Cube", category_id: cat2.id)

o1 = Order.create(status: 'waiting for delivery', customer_id: c1.id)
o2 = Order.create(status: 'waiting for delivery', customer_id: c2.id)

OrderItem.create(number_purchased: 3, product_id: p1.id, order_id: o1.id)
OrderItem.create(number_purchased: 2, product_id: p2.id, order_id: o1.id)
OrderItem.create(number_purchased: 5.5, product_id: p3.id, order_id: o1.id)
OrderItem.create(number_purchased: 15, product_id: p1.id, order_id: o2.id)
OrderItem.create(number_purchased: 1, product_id: p2.id, order_id: o2.id)
OrderItem.create(number_purchased: 3.4, product_id: p4.id, order_id: o2.id)
