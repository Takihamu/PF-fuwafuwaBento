class Customers::ItemsController < ApplicationController
  before_action :set_q, only: [:index, :search, :show]


  def index
    @items = Item.all
    @customer = current_customer
    @courses = Course.all
  end

  def search
    @results = @q.result
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

  private
  def set_q
    @q = Item.ransack(params[:q])
  end
end