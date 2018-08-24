class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_constroller?
  # before_action :require_login
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {u.permit(:first_name, :last_name, :email, :password, :password_confirmation)}
  end
end
