class Customers::ItemsController < ApplicationController
  def index
    @items = Item.all
    @customer = current_customer
    @courses = Course.all
  end

  def show
    @item = Item.find(params[:id])
    @order_item = OrderItem.new
    @customer = current_customer
    @courses = Course.all
  end

  def move_to_signed_in
    unless customer_signed_in?
      redirect_to '/customers/sign_in'
    end
  end
end