class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :shipping_postal_code
      t.string :receiver_name
      t.string :delivery_address
      t.integer :shipping_fee
      t.integer :total_price
      t.integer :payment_method
      t.integer :order_status, null: false, default: 0
      t.date    :logged_out_on

      t.timestamps
    end
  end
end
