class Admins::OrderItemsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_item = OrderItem.find(params[:id])
    if @order_item.update(order_item_params)
    end
    redirect_to admins_order_path(@order_item.order)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:production_status)
  end
end
