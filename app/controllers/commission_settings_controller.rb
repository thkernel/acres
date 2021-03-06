class CommissionSettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :current_excercise_year
  before_action :set_commission_setting, only: [:show, :edit, :update, :destroy]

  # GET /commission_settings
  # GET /commission_settings.json
  def index
    @commission_settings = CommissionSetting.where(excercise_year_id: current_excercise.id)
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
    @commission_setting.excercise_year_id = current_excercise.id
    respond_to do |format|
      if @commission_setting.save

        #compute_commission(@commission_setting.user_id)

        #format.html { redirect_to @commission_setting, notice: 'Commission setting was successfully created.' }
        format.html { redirect_to all_users_path, notice: 'Commission setting was successfully updated.' }

        format.json { render :show, status: :created, location: @commission_setting }
        #format.js
      else
        format.html { render :new }
        format.json { render json: @commission_setting.errors, status: :unprocessable_entity }
        #format.js
      end
    end
  end

  # PATCH/PUT /commission_settings/1
  # PATCH/PUT /commission_settings/1.json
  def update
    commission_was_changed = params[:commission_was_changed]

    rate_start_date = params[:rate_start_date]
    old_rate = params[:old_rate]
    new_rate = params[:commission_percentage]

    if commission_was_changed.present? && commission_was_changed == "true"
      if rate_start_date.present?
        
      
        user_commission_rate_tracker = UserCommissionRateTracker.new
        user_commission_rate_tracker.start_date = rate_start_date
        user_commission_rate_tracker.old_rate = old_rate
        user_commission_rate_tracker.new_rate = params[:commission_setting][:commission_percentage]
        user_commission_rate_tracker.user_id = current_user.id 
        user_commission_rate_tracker.excercise_year_id = current_excercise.id 
        user_commission_rate_tracker.save


      else
        respond_to do |format|
          format.html { redirect_to banks_path, alert: "Une erreur s'est passée lors de la modification. Vous n'avez renseigné la date d'effet."}
        end

        return
      end

    end
    
    respond_to do |format|
	  if @commission_setting.update(commission_setting_params)
    #compute_commission(@commission_setting.user_id)
    new_calculate_commissions({key: "user", value: @commission_setting.user_id })
		puts "UPDATE"
        #format.html { redirect_to @commission_setting, notice: 'Commission setting was successfully updated.' }
        format.html { redirect_to all_users_path, notice: 'Commission setting was successfully updated.' }
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
      params.require(:commission_setting).permit(:commission_percentage, :hypoplus_commission_percentage, :user_id)
    end

    
		
    
end
