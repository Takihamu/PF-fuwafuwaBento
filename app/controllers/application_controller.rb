class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource)
    customer_path(current_customer.id)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def require_login!
    if session[:customer_email].nil?
      redirect_to login_path
    end
  end


  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :last_name, :password, :password_confirmation,:postal_code, :address, :tel])
  end

end
