class BankSettingsController < ApplicationController
  before_action :authenticate_user!

  before_action :current_excercise_year
  before_action :set_bank_setting, only: [:show, :edit, :update, :destroy]

  # GET /bank_settings
  # GET /bank_settings.json
  def index
    @bank_settings = BankSetting.all
  end

  # GET /bank_settings/1
  # GET /bank_settings/1.json
  def show
  end

  # GET /bank_settings/new
  def new
    @bank = Bank.find(params[:bank_id])
    puts "PARAMS: #{params.inspect}"
    @bank_setting = BankSetting.new
  end

  # GET /bank_settings/1/edit
  def edit
    @bank = Bank.find(@bank_setting.bank_id)
   
  end

  # POST /bank_settings
  # POST /bank_settings.json
  def create
    @bank_setting = BankSetting.new(bank_setting_params)
    puts "CURRENT YEAR:#{current_excercise_year}"
    @bank_setting.excercise_year_id = current_excercise.id

    respond_to do |format|
      if @bank_setting.save
        format.html { redirect_to banks_path, notice: 'Bank setting was successfully created.' }
        format.json { render :show, status: :created, location: @bank_setting }
        format.js
      else
        format.html { render :new }
        format.json { render json: @bank_setting.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /bank_settings/1
  # PATCH/PUT /bank_settings/1.json
  def update

    commission_was_changed = params[:commission_was_changed]

    rate_start_date = params[:rate_start_date]
    old_rate = params[:old_rate]
    new_rate = params[:commission_percentage]

    if commission_was_changed.present? && commission_was_changed == "true"
      if rate_start_date.present?
        
        

        bank_commission_rate_tracker = BankCommissionRateTracker.new
        bank_commission_rate_tracker.start_date = rate_start_date
        bank_commission_rate_tracker.old_rate = old_rate
        bank_commission_rate_tracker.new_rate = params[:bank_setting][:commission_percentage]
        bank_commission_rate_tracker.bank_id =  @bank_setting.bank_id 
        bank_commission_rate_tracker.user_id = current_user.id 
        bank_commission_rate_tracker.excercise_year_id = current_excercise.id
        bank_commission_rate_tracker.save


      else
        respond_to do |format|
          format.html { redirect_to banks_path, alert: "Une erreur s'est passée lors de la modification. Vous n'avez renseigné la date d'effet."}
        end

        return
      end

    end
    
    respond_to do |format|
      if @bank_setting.update(bank_setting_params)
        new_calculate_commissions({key: "bank", value: @bank_setting.bank_id })

        format.html { redirect_to banks_path, notice: 'Bank setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @bank_setting }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @bank_setting.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /bank_settings/1
  # DELETE /bank_settings/1.json
  def destroy
    @bank_setting.destroy
    respond_to do |format|
      format.html { redirect_to bank_settings_url, notice: 'Bank setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_setting
      @bank_setting = BankSetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bank_setting_params
      params.require(:bank_setting).permit(:commission_percentage, :hypoplus_commission_percentage, :first_installment, :number_of_dates, :number_of_remaining_days, :company_remaining_commission_rate, :bank_id)
    end
end
