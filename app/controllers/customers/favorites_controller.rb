class Customers::FavoritesController < ApplicationController
  before_action :set_item

  def create
    favorite = current_customer.favorites.new(item_id: @item.id)
    favorite.save
  end

  def destroy
    favorite = current_customer.favorites.find_by(item_id: @item.id)

    favorite.destroy
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end
