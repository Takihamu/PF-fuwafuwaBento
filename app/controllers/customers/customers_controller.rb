class Customers::CustomersController < ApplicationController
  before_action :ensure_correct_customer, { only: %i[show edit] }

  def show
    @customer = Customer.find(params[:id])
    @orders = current_customer.orders
    @cart_items = CartItem.caliculate_customer_cart_items(current_customer)
    @q = Item.ransack(params[:q])
    # favorites = Favorite.where(customer_id: current_customer.id)
    # @favorite_list = Item.find(favorites)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    current_customer.update(customer_params)
    if customer.update(customer_params)
      redirect_to customer_path(current_customer.id)
    else
      render 'edit'
    end
  end

  def leave
    @customer = current_customer
  end

  def out
    @customer = current_customer
    sign_out current_customer if @customer.update(is_deleted: true)
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :tel, :email, :password, :postal_code, :address)
  end

  def ensure_correct_customer
    @customer = Customer.find(params[:id])
    redirect_to root_path if current_customer.id != @customer.id
  end
end
