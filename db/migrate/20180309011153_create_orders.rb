class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :status, null: false
      t.integer :customer_id, null: false

      t.timestamps
    end

    add_index :orders, :customer_id
  end
end
