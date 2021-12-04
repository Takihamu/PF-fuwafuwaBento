class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :tax_price
      t.integer :number_of_piaces
      t.integer :production_status, null: false, default: 0

      t.timestamps
    end
  end
end
