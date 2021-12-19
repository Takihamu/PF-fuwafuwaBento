class Item < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  attachment :image

  validates :item_status, inclusion: [true, false]
  enum course_name: { single: 0, randam: 1, season_single: 2, season_randam:3 }

  def add_tax_price
     (self.price * 1.10).round
  end

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end
end