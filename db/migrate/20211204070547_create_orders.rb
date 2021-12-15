class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :total_price
      t.integer :payment_method
      t.date    :logged_out_on
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
  end
end
