class Customers::FavoritesController < ApplicationController
  def create
    @favorite = Favorite.create(customer_id: current_customer.id,item_id: @item.id)
  end
end

def destroy
  @favorite = Favorite.find_by(customer_id: current_customer.id,item_id: @item.id)
  @favorite.destroy
end

private
def set_item
  @item = Item.find(params[:item_id])
end