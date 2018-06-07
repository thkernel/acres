class CustomUsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: [:show, :edit, :update, :destroy] # probably want to keep using this
    layout "dashboard"
    

    
    def new
      @roles = Role.where.not(name: "Superadmin")
      @user = User.new

    end
    def create
      @user = User.new(user_params)
      @user.created_by = current_user.id

      respond_to do |format|
        if @user.save
          @users = User.find_by_created_by(current_user).where.not(id: current_user)

          format.html { redirect_to users_path, notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: @contributor }
          format.js

          # Send mail to the new user.
         @smtp_settings = current_user.mail_configuration if !current_user.mail_configuration.nil?
         @delivery_method = ""

          NewUserMailer.set_smtp_settings(@smtp_settings)
          #NewUserMailer.delivery_method(@delivery_method)
          NewUserMailer.new_user_mail(@user.email, @user.password).deliver_now

        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
          format.js
        end
      end
    end

    def index
      @users = User.find_by_created_by(current_user).where.not(id: current_user)
      #puts "Mon host: " + host.to_s
      #@users = User.where.not(id: current_user)
	end
	
    # GET /users/1
    # GET /users/1.json
    def show
    end

    # GET /users/1/edit
    def edit
      @roles = Role.where.not(name: "Superadmin")
    end

    def delete
      @user = User.find(params[:id])
    end

    

	def destroy
    @users = User.all
    
    @user.destroy
    @users = User.find_by_created_by(current_user).where.not(id: current_user)
		respond_to do |format|
			format.html { redirect_to users_path, notice: 'User skill was successfully destroyed.' }
			format.json { head :no_content }
			format.js
		end
 	end

   	

    # # PATCH/PUT /users/1
    # # PATCH/PUT /users/1.json
    def update
      respond_to do |format|
		if @user.update(user_params)
       @users = User.find_by_created_by(current_user).where.not(id: current_user)
			
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
          format.js
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
          format.js
        end
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      if !@user.nil?
        return @user
        
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:full_name, :login, :email, :password, :password_confirmation, :role)
    end

end