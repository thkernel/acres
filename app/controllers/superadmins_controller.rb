class SuperadminsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.role = "Superadmin"
    @user.full_name ="Superadmin"
    @user.receives_notifications = false

    respond_to do |format|
      if @user.save

        format.html { redirect_to dashboard_path, notice: 'Super admin config was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
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
      params.require(:user).permit(:full_name,  :email, :password, :password_confirmation, :role, :receives_notifications)
    end
end
