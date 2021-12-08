class Customers::OrdersController < ApplicationController
  def new
    @order = Order.new
    @cart_item = CartItem.where(customer_id: current_customer.id)
    @customer = current_customer
  end

  def create
    @cart_items = current_customer.cart_items
    @order = current_customer.order.new(order_params)
    if order.save
      @cart_items.each do |cart_item|
      order_item = OrderItem.new
      order_item.item_id = cart_item.item_id
      order_item.number_of_piaces = cart_item.pieces
      order_item.save
    end
      redirect_to orders_complete_orders_path
      @cart_items.destroy.all
    else
      @order = Order.new(order_params)
      render.new
    end
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @ordered_items = @order.order_items
  end

  def complete
  end

  private
  def order_params
  params.require(:order).permit(:customer_id,:logged_out_on, :total_price, :payment_method, :receiver_name, :shipping_postal_code, :delivery_address, :order_status)
  end
end