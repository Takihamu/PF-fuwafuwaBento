class Item < ApplicationRecord
  has_many :carts, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :favorites,dependent: :destroy
  belongs_to :course
  belongs_to :costemer, optional: true
  attachment :image

  enum item_status: { on_sale: 0, sold_out: 1 }
  def add_tax_price
     (self.price * 1.10).round
  end
  Item.all.sum(:price)
end