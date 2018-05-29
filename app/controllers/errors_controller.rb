class ErrorsController < ApplicationController
	def show
		render status_code.to_s, :status => status_code, :layout => false
	end

	protected

	def status_code
		params[:code] || 500
	end
end