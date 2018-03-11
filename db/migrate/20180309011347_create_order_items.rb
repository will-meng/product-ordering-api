class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.float :number_purchased, null: false
      t.integer :product_id, null: false
      t.integer :order_id, null: false

      t.timestamps
    end

    add_index :order_items, :product_id
    add_index :order_items, :order_id
  end
end
