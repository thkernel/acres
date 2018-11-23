# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
  before_action :create_app_manager

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end


  def create_app_manager
    super_admin = Admin.all
  
    unless super_admin.present?
      redirect_to admin_registration_path
      #redirect_to app_manager_admin_path
    end
  end

end
