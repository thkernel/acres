class ApplicationController < ActionController::Base
	
	  protect_from_forgery with: :exception
	  
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :set_global
	
	after_action :set_mailer_settings
	# Include Application helper.
	include ApplicationHelper
 
	
	#add_flash_types :success, :danger, :info
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :full_name, :login])
		devise_parameter_sanitizer.permit(:account_update, keys: [:role, :full_name, :login, :avatar])
	end

  def after_sign_in_path_for(resource)
		dashboard_path
	
	end
	
	


	private
	def set_mailer_settings
		if  current_user.present?
			smtp_settings = current_user.mail_configuration 

			if current_user.mail_configuration.present?
				ActionMailer::Base.smtp_settings.merge!({
					:address => smtp_settings.address , 
					:port => smtp_settings.port,
					:domain => smtp_settings.domain,
					:authentication => 'plain',
					:user_name => smtp_settings.user_name,
					:password => smtp_settings.password,
					:enable_starttls_auto => true
				})
				
			end
				#ActionMailer::Base.default_options = {from: "slatejob.official@gmail.com"}

		end

  end

  def set_global
	config_option = ConfigOption.first
	@app_name = config_option.app_name if config_option.present?
  end

  def configure_super_admin
	super_admin = SuperAdminConfig.all

	unless super_admin.present?
		redirect_to super_admin_config_path
	end
  end
	
end
