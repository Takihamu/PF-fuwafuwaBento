class ApplicationController < ActionController::Base
  before_action :set_q
  protect_from_forgery with: :exception
  def after_sign_in_path_for(_resource)
    customer_path(current_customer.id)
  end

  def after_sign_out_path_for(_resource)
    root_path
  end

  def require_login!
    redirect_to login_path if session[:customer_email].nil?
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[email first_name last_name password password_confirmation postal_code
                                               address tel])
  end

  def set_q
    @q = Item.ransack(params[:q])
  end
end
