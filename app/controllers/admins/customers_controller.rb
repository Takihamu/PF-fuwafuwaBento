class Admins::CustomersController < ApplicationController
  def index
    @customer = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def updated_at
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admins_customer_path(@customer)
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :postal_code, :address, :tel, :is_deleted)
  end
end
