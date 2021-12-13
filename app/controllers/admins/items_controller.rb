class Admins::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def index
    @item = Item.all
  end

  def search
    if params[:keyeord].present?
      @item = Item.where('item_name LIKE ?', "%#{params[:keyword]}%")
    else
      @items = Item.none
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to admins_item_path(@item.id)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admins_item_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name,:detail,:price,:item_status,:course_id,:cal,:energy,:start,:end,:course_name)
  end
end
