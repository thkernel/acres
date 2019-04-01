class HomeController < ApplicationController
    before_action :for_domain
    layout "home"
    
    def index 
    end


    def for_domain
        if request.subdomain.present? && request.subdomain != 'www' 
            redirect_to new_user_session_path
        
        
        end
    
    end
end