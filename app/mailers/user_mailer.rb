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
	def enable_user_mail(email, password, url)
		
		@url  = url
        @email = email
        @password = password
		mail(to: @email, subject: "Compte activé")
	end
	def disable_user_mail(email, password, url)
		
		@url  = url
        @email = email
        @password = password
		mail(to: @email, subject: "Compte désactivé")
	end

	def delete_user_mail(email, password, url)
		
		@url  = url
        @email = email
        @password = password
		mail(to: @email, subject: "Suppression de votre compte")
	end

	
end
