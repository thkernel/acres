class NewUserMailer < ApplicationMailer
	
	#before_action :set_delivery_options
	
               
	#include SmtpHelper
	helper :application
	
  	add_template_helper EmailHelper
  	add_template_helper ApplicationHelper
	default from: 'SlateJob <imofy.official@gmail.com>'

	def new_user_mail(email, password)
		@url  = ENV['HOST']
        @email = email
        @password = password
		mail(to: @email, subject: "Création de compte")
	end

	def set_smtp_settings(smtp_settings)
		ssmtp_settings = {

		:address => smtp_settings.address, 
		:port => smtp_settings.port,
		:domain => smtp_settings.domain,
		:authentication => 'plain',
		:user_name => smtp_settings.user_name,
		:password => smtp_settings.password,
		:enable_starttls_auto => true
		
	
		}
		
		mail.smtp_settings.settings.merge!(ssmtp_settings)


	end

	def set_delivery_options
		#mail.delivery_method.settings.merge!= :smtp
	end
	def set_default_url_options
		#ActionMailer::Base.default_url_options = { :host => "localhost:3000" }
		#mail.default_url_options.settings = { host: 'localhost', port: 3000 }
	end

	#self.smtp_settings = {

		#:address => 'smtp.gmail.com', 
		#:port => 587,
		
		#:domain => 'gmail.com',
		
		#:authentication => 'plain',
		
		#:user_name => '#{get_user_name}',
		
		#:password => '#{get_password}',
		
		#:enable_starttls_auto => true
	
		
		
		#}
	self.default_url_options = { host: 'localhost', port: 3000 }
	#self.delivery_method = :smtp


	private
 
    def set_delivery_options
     puts "Mon mail: " +  @current_user.email
    end
 
    
end
