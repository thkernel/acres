class CustomUsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: [:show, :edit, :update] # probably want to keep using this
    layout "dashboard"

    
    def new
      @user = User.new
    end
    def create
      @user = User.new(user_params)

      respond_to do |format|
        if @user.save
          format.html { redirect_to @user, notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: @contributor }
          format.js
          # Send mail to the new user.
          NewUserMailer.new_user_mail(@user.email, @user.password).deliver_now

        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
          format.js
        end
      end
    end

    def index
      @users = User.all
	end
	
    # GET /users/1
    # GET /users/1.json
    def show
    end

    # GET /users/1/edit
    def edit
    end

	# DELETE /user_skills/1
	# DELETE /user_skills/1.json
	def destroy
		
		@user.destroy
		respond_to do |format|
			format.html { redirect_to users_path, notice: 'User skill was successfully destroyed.' }
			format.json { head :no_content }
			format.js
		end
 	end

   	def delete
     @user = User.find(params[:id])
 	end

    # # PATCH/PUT /users/1
    # # PATCH/PUT /users/1.json
    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

end