class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :items, through: :favorites
  has_many :order_items, dependent: :destroy

  validates :is_deleted, inclusion: { in: [true, false] }

  #def favorited_items
    #favorites  = current_customer.favorites
    #favorites_items = []
    #favorites.each do |favorite|
      #favorites_items <<= favorite.item
    #end
    #return favorite_items
  #end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
    customer.password = SecureRandom.urlsafe_base64
  end
end
end