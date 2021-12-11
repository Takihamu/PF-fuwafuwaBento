class OrderItem < ApplicationRecord
   belongs_to :order
   belongs_to :item

   def self.insert_order_item(cart_item, order)
     order_item = self.new
     order_item.item_id = cart_item.item_id
     order_item.order_id = order.id
     order_item.tax_price = order.total_price
     order_item.number_of_piaces = cart_item.pieces
     order_item.save!
   end
end
