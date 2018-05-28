class MailConfigurationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_mail_configuration, only: [:show, :edit, :update, :destroy]
  layout "dashboard"

  # GET /mail_configurations
  # GET /mail_configurations.json
  def index
    @mail_configurations = MailConfiguration.all
  end

  # GET /mail_configurations/1
  # GET /mail_configurations/1.json
  def show
  end

  # GET /mail_configurations/new
  def new
    @mail_configuration = MailConfiguration.new
  end

  # GET /mail_configurations/1/edit
  def edit
  end

  # POST /mail_configurations
  # POST /mail_configurations.json
  def create
    @mail_configuration = MailConfiguration.new(mail_configuration_params)

    respond_to do |format|
      if @mail_configuration.save
        format.html { redirect_to @mail_configuration, notice: 'Mail configuration was successfully created.' }
        format.json { render :show, status: :created, location: @mail_configuration }
        format.js
      else
        format.html { render :new }
        format.json { render json: @mail_configuration.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /mail_configurations/1
  # PATCH/PUT /mail_configurations/1.json
  def update
    respond_to do |format|
      if @mail_configuration.update(mail_configuration_params)
        format.html { redirect_to @mail_configuration, notice: 'Mail configuration was successfully updated.' }
        format.json { render :show, status: :ok, location: @mail_configuration }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @mail_configuration.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /mail_configurations/1
  # DELETE /mail_configurations/1.json
  def destroy
    @mail_configuration.destroy
    respond_to do |format|
      format.html { redirect_to mail_configurations_url, notice: 'Mail configuration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mail_configuration
      @mail_configuration = MailConfiguration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mail_configuration_params
      params.require(:mail_configuration).permit(:host, :user_name, :password, :domain, :address, :port, :authentication, :enable_starttls_auto, :boolean, :ssl, :user_id)
    end
end
