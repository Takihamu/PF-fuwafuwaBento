class Customers::OrdersController < ApplicationController
  def new
    @order = Order.new(order_params)
    @cart_item = CartItem.where(customer_id: current_customer.id)
    @customer = current_customer
  end

  def create
    @cart_items = current_customer.cart_items
    @order = current_customer.orders.new(order_params)

    if @order.save!
      @cart_items.each do |cart_item|
        OrderItem.insert_order_item(cart_item, @order)
      end

      @cart_items.destroy_all
      redirect_to orders_complete_orders_path
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
    @cart_items = current_customer.cart_items.all
  end

  def complete
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :logged_out_on, :total_price, :payment_method,:start_date)
  end
end