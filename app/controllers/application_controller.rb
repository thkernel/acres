class ApplicationController < ActionController::Base
	
  protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_user
	

	#add_flash_types :success, :danger, :info
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
		devise_parameter_sanitizer.permit(:account_update, keys: [:role])
	end

  def after_sign_in_path_for(resource)
		dashboard_path
	
	end
	
	def set_current_user
		User.current = current_user
	end
	
	
end
