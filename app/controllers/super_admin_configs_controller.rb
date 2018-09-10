class SuperAdminConfigsController < ApplicationController
  before_action :set_super_admin_config, only: [:show, :edit, :update, :destroy]

  # GET /super_admin_configs
  # GET /super_admin_configs.json
  def index
    @super_admin_configs = SuperAdminConfig.all
  end

  def setup
   
    super_admin_config = SuperAdminConfig.all

    unless super_admin_config.present?
      @super_admin_config = SuperAdminConfig.new			
    else
      redirect_to super_admin_configs_path
    end

  end

  # GET /super_admin_configs/1
  # GET /super_admin_configs/1.json
  def show
  end

  # GET /super_admin_configs/new
  def new
    @super_admin_config = SuperAdminConfig.new
  end

  # GET /super_admin_configs/1/edit
  def edit
  end

  # POST /super_admin_configs
  # POST /super_admin_configs.json
  def create
    @super_admin_config = SuperAdminConfig.new(super_admin_config_params)

    respond_to do |format|
      if @super_admin_config.save
        super_admin = User.new

        super_admin.full_name = @super_admin_config.login if @super_admin_config.login.present?
        super_admin.email = @super_admin_config.email if @super_admin_config.email.present?
        super_admin.password = @super_admin_config.password if @super_admin_config.password.present?
        super_admin.password_confirmation = @super_admin_config.password if @super_admin_config.password.present?
        super_admin.role = "Superadmin"
        super_admin.save

        format.html { redirect_to dashboard_path, notice: 'Super admin config was successfully created.' }
        format.json { render :show, status: :created, location: @super_admin_config }
      else
        format.html { render :new }
        format.json { render json: @super_admin_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /super_admin_configs/1
  # PATCH/PUT /super_admin_configs/1.json
  def update
    respond_to do |format|
      if @super_admin_config.update(super_admin_config_params)
        format.html { redirect_to @super_admin_config, notice: 'Super admin config was successfully updated.' }
        format.json { render :show, status: :ok, location: @super_admin_config }
      else
        format.html { render :edit }
        format.json { render json: @super_admin_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /super_admin_configs/1
  # DELETE /super_admin_configs/1.json
  def destroy
    @super_admin_config.destroy
    respond_to do |format|
      format.html { redirect_to super_admin_configs_url, notice: 'Super admin config was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_super_admin_config
      @super_admin_config = SuperAdminConfig.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def super_admin_config_params
      params.require(:super_admin_config).permit(:login, :email, :password)
    end
end
