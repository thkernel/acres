class UserMailer < ApplicationMailer
	
	#include SmtpHelper
	helper :application
	
  	add_template_helper EmailHelper
  	add_template_helper ApplicationHelper
	default from: '<imofy.official@gmail.com>'

	def new_user_mail(email, password, url)
		
		@url  = url
        @email = email
        @password = password
		mail(to: @email, subject: "Création de compte")
	end

	def edit_user_mail(email, password, url)
		
		@url  = url
        @email = email
        @password = password
		mail(to: @email, subject: "Modification d'informations de connexion")
	end


	
end
