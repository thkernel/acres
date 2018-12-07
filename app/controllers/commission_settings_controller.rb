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

        compute_commission(@commission_setting.user_id)

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
    respond_to do |format|
	  if @commission_setting.update(commission_setting_params)
		compute_commission(@commission_setting.user_id)
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

    def compute_commission(user_id)
		user = User.find(user_id)
		profile = user.role
		#puts "Profile: " + profile

		# Get company infos required infos for the compute.
		if  current_company.present?
			company_name = current_company.name 
			company_commission_net = 0.0
			company_commission_percentage = 0.0

		end

		if user.commission_setting.present?
			producer_commission_percentage = user.commission_setting.commission_percentage 
			producer_hypoplus_commission_percentage = user.commission_setting.hypoplus_commission_percentage 
			producer_commission = 0.0
		end

		if user.commission_setting.present?
			contributor_commission_percentage = user.commission_setting.commission_percentage 
			contributor_hypoplus_commission_percentage = user.commission_setting.hypoplus_commission_percentage 
			contributor_commission = 0.0
		end

      	if profile == "Apporteur"
			# Get contributor required infos for the compute.
			@user_commissions = Commission.where(contributor_name: user.full_name)
			
      	elsif profile == "Producteur"
        	@user_commissions = Commission.where(producer_name: user.full_name)
			
		end
		
		# Loop all commissions.
		@user_commissions.each do |commission|
			contributor_name = commission.contributor_name 
			producer_name = commission.producer_name

			# Get bank infos required infos for the compute.
			if commission.bank_name.present?
				bank_name = commission.bank_name 
				bank = Bank.find_by(name: bank_name)

				if bank.present? && bank.commission_percentage.present?
					bank_commission_percentage = bank.commission_percentage 
					bank_hypoplus_commission_percentage = bank.hypoplus_commission_percentage 
					bank_amount_commission = 0.0
				end
			end

			if commission.amount_credit.present?
				credit_amount = commission.amount_credit 
			end

			# Rule 1
			if contributor_name == company_name || producer_name == company_name || contributor_name.blank?
				if  bank_commission_percentage.present?

				contributor_commission_percentage = 0.0 
				producer_commission_percentage = 0.0
				
				contributor_commission = 0.0
				producer_commission = 0.0
				bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
				company_commission_net = bank_amount_commission
				company_commission_percentage = (company_commission_net / credit_amount) * 100
			end
		end

			# Rule 2 
			if contributor_name ==  producer_name 
				if contributor_commission_percentage.present? && producer_commission_percentage.present? && bank_commission_percentage.present?

					contributor_commission = 0.0
					producer_commission = (credit_amount * producer_commission_percentage) / 100
					bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
					company_commission_net = bank_amount_commission - producer_commission - contributor_commission
					company_commission_percentage = (company_commission_net / credit_amount) * 100

				end
				#else
				#if contributor_commission_percentage.present? && producer_commission_percentage.present? && bank_commission_percentage.present?

					#contributor_commission = (credit_amount * contributor_commission_percentage) / 100
					#producer_commission = (credit_amount * producer_commission_percentage) / 100
					#bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
					#company_commission_net = bank_amount_commission - producer_commission - contributor_commission
				#end
			end

			# Rule 3 
			if contributor_name.present? && contributor_commission_percentage.present? && producer_commission_percentage.present? && bank_commission_percentage.present?
				if contributor_name != producer_name  && contributor_name != company_name 
					
					producer_commission = (credit_amount * producer_commission_percentage) / 100
					bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
					company_commission_net = bank_amount_commission - producer_commission 
					contributor_commission = (company_commission_net / 2 ) + (producer_commission / 2)
					company_commission_percentage = (company_commission_net / credit_amount) * 100

				end

				#elsif producer_name ==  company_name || producer_name.blank?
				#if contributor_commission_percentage.present? && producer_commission_percentage.present? && bank_commission_percentage.present?
					#contributor_commission = (credit_amount * contributor_commission_percentage) / 100
					#producer_commission = (credit_amount * producer_commission_percentage) / 100
					#bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
					#company_commission_net = bank_amount_commission - producer_commission - contributor_commission
					#company_commission_net = company_commission_net - contributor_commission
				#end
			
			end
			# Rule 4
			#if producer_name.present? && contributor_commission_percentage.present? && producer_commission_percentage.present? && bank_commission_percentage.present?
				#if producer_name == company_name || !producer_name.present?

					#contributor_commission = (credit_amount * contributor_commission_percentage) / 100
					#producer_commission = (credit_amount * producer_commission_percentage) / 100
					#bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
					#company_commission_net = bank_amount_commission - producer_commission - contributor_commission
					#company_commission_percentage = (company_commission_net / credit_amount) * 100

				#end
			#end

			# Rule 5 (Hypoplus)
			#if hypoplus.present?
				#if producer_name != company_name || !producer_name.present?
					#contributor_commission = 0.0
					#bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
					#producer_commission = (bank_amount_commission / 2) 
					#company_commission_net =  (bank_amount_commission / 2) 
				#else

					#contributor_commission = 0.0
					#bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
					#producer_commission = 0.0
					#company_commission_net =  bank_amount_commission 
				#end
			#end

			# Saving.
			commission.contributor_commission = contributor_commission
			commission.contributor_commission_percentage = contributor_commission_percentage
			commission.producer_commission = producer_commission
			commission.producer_commission_percentage = producer_commission_percentage
			commission.bank_commission = bank_amount_commission
			commission.bank_commission_percentage = bank_commission_percentage
			commission.company_commission = company_commission_net
			commission.company_commission_percentage = company_commission_percentage
			commission.user_id = current_user.id
			commission.save
		end
    
		
    end
end
