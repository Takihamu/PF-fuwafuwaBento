class Customers::FavoritesController < ApplicationController
  before_action :set_item

  def create
    @favorite = current_customer.favorites.new(item_id: @item.id)
    @favorite.save
    @favorite_items = current_customer.items.includes(:favorites).order("favorites.created_at DESC")
    @item = @favorite.item
  end

  def destroy
    @favorite = current_customer.favorites.find_by(item_id: @item.id)
    @item = @favorite.item
    @favorite.destroy
    @favorite_items = current_customer.items.includes(:favorites).order("favorites.created_at DESC")
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end
