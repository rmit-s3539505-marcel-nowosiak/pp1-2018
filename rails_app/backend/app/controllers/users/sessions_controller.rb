# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    @current_user = reset_session
    redirect_to '/'
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  # devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def after_sign_in_path_for(resource)
    '/' # Or :prefix_to_your_route
  end
end
