class NewUserMailer < ApplicationMailer
	
	#include SmtpHelper
	helper :application
	
  	add_template_helper EmailHelper
  	add_template_helper ApplicationHelper
	default from: '<imofy.official@gmail.com>'

	def new_user_mail(email, password)
		
		@url  = ENV['HOST']
        @email = email
        @password = password
		mail(to: @email, subject: "Création de compte")
	end


	
end
