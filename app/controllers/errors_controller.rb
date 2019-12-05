class ErrorsController < ApplicationController
	layout "error"

	def not_found
		respond_to do |format|
		  format.html { render status: 404 }
		  format.json { render json: { error: "Resource not found" }, status: 404 }
		end
	end
   
	def unacceptable
		respond_to do |format|
		  format.html { render status: 422 }
		  format.json { render json: { error: "Params unacceptable" }, status: 422 }
		end
	end
   
	def internal_error
		respond_to do |format|
			format.html { render status: 500 }
			format.json { render json: { error: "Internal server error" }, status: 500 }
		end
	end


	def show
		render status_code.to_s, :status => status_code, :layout => false
	end

	protected

	def status_code
		params[:code] || 500
	end
end