class Admins::CousesController < ApplicationController

  def index
    @couse = Couse.new
    @couse = Couse.all
  end

  def create
    @couse = Couse.new(couse_params)
    if @couse.save
      redirect_to admins_couses_path
    else
      @couses = Couse.all
      render :index
    end
  end

  def edit
    @couses = Couse.find(params[:id])
  end

  def updated
    @couse = Couse.find(params[:id])
    if @couse.update(couse_params)
      redirect_to admins_couses_path
    else
      render :edit
    end
  end

  private
  def couse_params
    params.require(:couse).permit(:name)
  end
end