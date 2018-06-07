class CommissionSettingsController < ApplicationController
  before_action :set_commission_setting, only: [:show, :edit, :update, :destroy]

  # GET /commission_settings
  # GET /commission_settings.json
  def index
    @commission_settings = CommissionSetting.all
  end

  # GET /commission_settings/1
  # GET /commission_settings/1.json
  def show
  end

  # GET /commission_settings/new
  def new
    @commission_setting = CommissionSetting.new
  end

  # GET /commission_settings/1/edit
  def edit
  end

  # POST /commission_settings
  # POST /commission_settings.json
  def create
    @commission_setting = CommissionSetting.new(commission_setting_params)

    respond_to do |format|
      if @commission_setting.save
        format.html { redirect_to @commission_setting, notice: 'Commission setting was successfully created.' }
        format.json { render :show, status: :created, location: @commission_setting }
        format.js
      else
        format.html { render :new }
        format.json { render json: @commission_setting.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /commission_settings/1
  # PATCH/PUT /commission_settings/1.json
  def update
    respond_to do |format|
      if @commission_setting.update(commission_setting_params)
        format.html { redirect_to @commission_setting, notice: 'Commission setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @commission_setting }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @commission_setting.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /commission_settings/1
  # DELETE /commission_settings/1.json
  def destroy
    @commission_setting.destroy
    respond_to do |format|
      format.html { redirect_to commission_settings_url, notice: 'Commission setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commission_setting
      @commission_setting = CommissionSetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def commission_setting_params
      params.require(:commission_setting).permit(:commission_percentage, :hypoplus_commission_percentage, :first_installment, :number_of_dates, :user_id)
    end
end
