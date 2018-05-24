class NewUserMailer < ApplicationMailer
	helper :application
  	add_template_helper EmailHelper
  	add_template_helper ApplicationHelper
	default from: 'SlateJob <support@slatejob.com>'

	def new_user_mail(email, password)
		@url  = ENV['HOST']
        @email = email
        @password = password
		mail(to: @email, subject: "Création de compte")
	end
end
