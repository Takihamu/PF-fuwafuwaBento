class Customers::ItemsController < ApplicationController
  before_action :move_to_signed_in, except: [:index]
  before_action :set_q, only: [:index, :search, :show]


  def index
    @items = Item.all
    @customer = current_customer
    @cart_items = CartItem.caliculate_customer_cart_items(current_customer)
    @favorite_items = current_customer.items.includes(:favorites).order("favorites.created_at DESC")
  end

  def search
    @search = Item.ransack(params[:q])
    @results = @q.result(distinct: true)
  end

  def show
    @item = Item.find(params[:id])
    @order_item = OrderItem.new
    @customer = current_customer
    @cart_items = CartItem.caliculate_customer_cart_items(current_customer)
  end

  def move_to_signed_in
    unless customer_signed_in?
      redirect_to '/customers/sign_in'
    end
  end

  private
  def set_q
    @q = Item.ransack(params[:q])
  end
end