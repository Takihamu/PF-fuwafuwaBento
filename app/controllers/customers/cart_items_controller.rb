class Customers::CartItemsController < ApplicationController
  before_action :move_to_signed_in

  def index
    @cart_items = CartItem.all
    @customer_cart_items = CartItem.where(customer_id: current_customer.id)
  end

  def create
    @cart_items = CartItem.new(cart_item_params)
    @item = @cart_item.item
    if @cart_item.save
      redirect_to cart_item_path
    else
      redirect_to item_path(@item)
    end
  end

  def updated
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to request.refere
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    if cart_item.destroy
      redirect_to request.refere
    end
  end

  def destroy_all
    if CartItem.destroy_all
      redirect_to request.refere
    end
  end

  def move_to_signed_in
    unless customer_signed_in?
      redirect_to  '/customers/sign_in'
    end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :pieces)
  end
end