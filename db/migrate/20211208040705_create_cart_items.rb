class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|

      t.integer "customer_id"
      t.integer "item_id"
      t.integer "pieces"
      t.date "start_date"
      t.date "end_date"
      t.datetime "created_at", null: false
      t.timestamps
    end
  end
end
