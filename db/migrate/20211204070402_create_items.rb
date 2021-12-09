class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :course_id
      t.string :item_name
      t.string :image_id
      t.text :detail
      t.integer :price
      t.integer :energy
      t.string :cal
      t.boolean :item_status, null: false, default: true
      t.date :logged_out_on
      t.date :start
      t.date :end
      t.timestamps
    end
  end
end
