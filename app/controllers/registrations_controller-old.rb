class RegistrationsController < Devise::RegistrationsController
    #after_action :create_profile, only: [:create]
    #prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.

    #private
    #def check_captcha
        #unless verify_recaptcha
            #self.resource = resource_class.new sign_up_params
            #resource.validate # Look for any other validation errors besides Recaptcha
            #respond_with_navigational(resource) { render :new }
        #end 
    #end

    def after_update_path_for(resource)
        dashboard_path
    end

    def after_sign_in_path_for(resource)
       
            dashboard_path
     
    
    end

   

end