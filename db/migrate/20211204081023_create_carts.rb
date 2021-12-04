class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.integer :customer_id
      t.integer :item_id
      t.integer :pieces

      t.timestamps
    end
  end
end
