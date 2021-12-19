class Customers::FavoritesController < ApplicationController
  before_action :set_item

  def create
    item = Item.find(params[:item_id])
    favorite = current_customer.favorites.new(item_id: item.id)
    favorite.save
    redirect_to item_path(item)
  end
end

def destroy
  item = Item.find(params[:item_id])
  favorite = current_customer.favorites.new(item_id: item.id)
  favorite.destroy
  redirect_to item_path(item)
end

private
def set_item
  @item = Item.find(params[:item_id])
end