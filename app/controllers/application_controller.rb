class ApplicationController < ActionController::Base
	include CheckExcerciseYearConcern
	  protect_from_forgery with: :exception
	
	#before_action :configure_permitted_parameters, if: :devise_controller?
	#before_action :set_global
	#before_action :app_setup
	
	
	
	
	
	
	#after_action :set_mailer_settings
	# Include Application helper.
	include ApplicationHelper
	include ExcerciseYearsHelper
	include BanksHelper
 
	
	#add_flash_types :success, :danger, :info
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :full_name, :login])
		devise_parameter_sanitizer.permit(:account_update, keys: [:role, :full_name, :login, :avatar])
	end
=begin
  def after_sign_in_path_for(resource)
		dashboard_path
	
	end
=end
	


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

  
	

	# Application setup.
    def app_setup

    	# If subdomain.
      if request.subdomain.present? && request.subdomain != 'www'   
          super_admin = User.find_by_superadmin("Superadmin")

					
          #puts "Users:  #{super_admin}"
        	puts "Current sub: #{Apartment::Tenant.current}"
					if get_account_status?(request.subdomain)
						unless super_admin.present?
							redirect_to new_superadmin_path
						end

					else
						redirect_to unauthorize_path
					end

      else
        
          manager = User.find_by_role(ROLE_MANAGER)

          unless manager.present?
            redirect_to new_manager_path
          end
        
      end
		end
		
	
		
		

end
