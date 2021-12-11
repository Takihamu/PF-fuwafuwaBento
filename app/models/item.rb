class Item < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :favorites,dependent: :destroy
  has_many :cart_items, dependent: :destroy
  belongs_to :course
  attachment :image

  enum item_status: { on_sale: 0, sold_out: 1 }

  def add_tax_price
     (self.price * 1.10).round
  end
end