class Item < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :favorites,dependent: :destroy
  has_many :cart_items, dependent: :destroy
  attachment :image

  enum item_status: { on_sale: true, sold_out: false }
  enum course_name: { single: 0, randam: 1, season_single: 2, season_randam:3 }

  def add_tax_price
     (self.price * 1.10).round
  end
end