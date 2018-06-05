module SmtpHelper
    def user_name
        user = User.current
         user.mail_configuration.user_name
        
    end

    def password
        user = User.current
        user.mail_configuration.password
    
      
    end
end
