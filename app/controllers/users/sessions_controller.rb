# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  before_action :app_setup
  #before_action :superadmin_setup

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

  
  private


  def superadmin_setup 

    user = User.all

	# If user
	if user.present?
		super_admin = User.find_by_role(ROLE_SUPER_ADMIN)

		unless super_admin.present?
			redirect_to new_superadmin_path
		end
	end

  end

	# Application setup.
    def app_setup

    	# If subdomain.
		if request.subdomain.present? && request.subdomain != 'www'   
		
			  
				super_admin = User.find_by_role(ROLE_SUPER_ADMIN)

				unless super_admin.present?
					redirect_to new_superadmin_path
				end
			

		else
			
		
				manager = User.find_by_role(ROLE_MANAGER)

				unless manager.present?
					redirect_to new_manager_path
				end
			
		end
    end
    
end
