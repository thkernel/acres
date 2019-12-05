class CommissionsController < ApplicationController
	# This controller is reserved for all user authenticate users
	before_action :authenticate_user!
	before_action :current_excercise_year


	# Calling set_commion methode on before action to initialize commissions variable.
	before_action :set_commission, only: [:show, :edit, :update, :destroy]
	
	# Calling compute_commissions methode on after action to compute the commission.
	#after_action  :compute_commissions

	

	# Render dashboard layout for all actions.
	layout "dashboard"

	def abandonments
		@commissions = Commission.where(excercise_year_id: current_excercise.id)
	end

	def abandon

		@credit_identifier = params[:identifier]
		commission = Commission.where(["excercise_year_id = ? AND credit_identifier = ? ",  current_excercise.id, @credit_identifier]).take
		
		bank_name = commission.bank_name
		@bank = Bank.find_by(name: bank_name)
		#@bank = Bank.where(["name = ? AND excercise_year_id = ?", bank_name, current_excercise.id]).take

		puts "CREDIT ID: #{@credit_id}"
	end

	def post_abandon 
		commission_rate = params[:commission_rate] if params[:commission_rate]
		credit_identifier  = params[:credit_identifier] if params[:credit_identifier]
		bank_name = params[:bank_name] if params[:bank_name]
		puts "% Commission: #{commission_rate}"

		bank_commission_rate_abandonment = BankCommissionRateAbandonment.new
		bank_commission_rate_abandonment.bank_name = bank_name 
		bank_commission_rate_abandonment.credit_identifier = credit_identifier
		bank_commission_rate_abandonment.abandonment_rate = commission_rate 
		bank_commission_rate_abandonment.user_id = current_user.id 
		bank_commission_rate_abandonment.excercise_year_id = current_excercise.id



	
		respond_to do |format|
			if bank_commission_rate_abandonment.save
				#calculate_abandonment_commission(bank_name, credit_id, commission_rate)
				
				format.html { redirect_to abandonments_path, notice: 'Abandonment was successfully created.' }
				#format.js
			end
		end


	end



	def contributors
		@total_montant_credit = Commission.where(excercise_year_id: current_excercise.id).sum(:amount_credit)
		@total_commission_apporteur = Commission.where(excercise_year_id: current_excercise.id).sum(:contributor_commission)
		@total_commission_nette_company = Commission.where(excercise_year_id: current_excercise.id).sum(:producer_commission)
		#@total_commission_producteur = Commission.all.sum(:company_commission)

		if current_user.present? && is_contributor?(current_user)
			@commissions = Commission.where(contributor_name: current_user.full_name).where(excercise_year_id: current_excercise.id)
		else
			#@commissions = current_user.commissions 
			users = User.where(role: 'Apporteur')
			
			if users.present?
				@commissions = []
				users.each do |user|
					commissions = Commission.where(contributor_name: user.full_name).where(excercise_year_id: current_excercise.id)

					if commissions.present? 
						
						commissions.each{|commission|
							@commissions.push(commission)
						}
						
					end
					
				end
			end
		end

		
	end

	def producers
		@total_montant_credit = Commission.where(excercise_year_id: current_excercise.id).sum(:amount_credit)
		#@total_commission_apporteur = Commission.all.sum(:contributor_commission)
		@total_commission_nette_company = Commission.where(excercise_year_id: current_excercise.id).sum(:producer_commission)
		@total_commission_producteur = Commission.where(excercise_year_id: current_excercise.id).sum(:company_commission)

		if current_user.present? && is_producer?(current_user) || current_user.present? && is_cocourtier?(current_user)
			@commissions = Commission.where(producer_name: current_user.full_name).where(excercise_year_id: current_excercise.id)
		
		else

			#@commissions = current_user.commissions 
			#users = User.where(role: 'Producteur', role: "Co-courtier")
			users = User.where(["role = ? OR role = ?", "Producteur", "Co-courtier"])
			
			if users.present?
				@commissions = []
				users.each do |user|
					commissions = Commission.where(producer_name: user.full_name).where(excercise_year_id: current_excercise.id)
					if commissions.present?
						commissions.each do |commission|
							@commissions.push(commission)
						end
					end
					
				end
			end
		end
	end

	def banks
		@commissions = Commission.where(excercise_year_id: current_excercise.id)
		#@commissions = @commissions.where(user_id: get_main_admin(current_user))

	end

	def company 
		@commissions = Commission.where(excercise_year_id: current_excercise.id)
		@commissions = @commissions.where(user_id: get_main_admin(current_user))

	end
	# GET /commissions
	# GET /commissions.json
	def index
		@commissions = Commission.where(excercise_year_id: current_excercise.id)
		@commissions = @commissions.where(user_id: get_main_admin(current_user))

	end

	def resume_producer
		if params[:producer_name].present?
			@producer_name = params[:producer_name] 
			
			@producer = User.find_by(full_name: @producer_name)
			@producer_commission_percentage = @producer.commission_setting.commission_percentage if @producer.commission_setting.present?
			
			@commissions = Commission.where(producer_name: @producer_name).where(excercise_year_id: current_excercise.id)
			@commissions = @commissions.where(user_id: get_main_admin(current_user))

		elsif params[:producer_name].blank?
			@producer_name = current_user.full_name 
			
			@producer = User.find_by(full_name: @producer_name)
			@producer_commission_percentage = @producer.commission_setting.commission_percentage if @producer.commission_setting.present?
			
			@commissions = Commission.where(producer_name: @producer_name).where(excercise_year_id: current_excercise.id)
			@commissions = @commissions.where(user_id: get_main_admin(current_user))

			

		end

		@total_montant_credit = @commissions.sum(:amount_credit)
    	@total_commission_apporteur = @commissions.sum(:contributor_commission)
    	@total_commission_nette_company = @commissions.sum(:producer_commission)
    	@total_commission_producteur = @commissions.sum(:company_commission)
		
	end

	def resume_contributor
		if params[:contributor_name].present?
			@contributor_name = params[:contributor_name] 
			
			@contributor = User.find_by(full_name: @contributor_name)
			@contributor_commission_percentage = @contributor.commission_setting.commission_percentage if @contributor.commission_setting.present?
			
			@commissions = Commission.where(contributor_name: @contributor_name).where(excercise_year_id: current_excercise.id)
			@commissions = @commissions.where(user_id: get_main_admin(current_user))

			
			
		elsif params[:contributor_name].blank?
			@contributor_name = current_user.full_name 
			
			@contributor = User.find_by(full_name: @contributor_name)
			@contributor_commission_percentage = @contributor.commission_setting.commission_percentage if @contributor.commission_setting.present?
			
			@commissions = Commission.where(contributor_name: @contributor_name).where(excercise_year_id: current_excercise.id)
			@commissions = @commissions.where(user_id: get_main_admin(current_user))

			

		end

		@total_montant_credit = @commissions.sum(:amount_credit)
    	@total_commission_apporteur = @commissions.sum(:contributor_commission)
    	@total_commission_nette_company = @commissions.sum(:producer_commission)
    	@total_commission_producteur = @commissions.sum(:company_commission)
		
	end

	def resume_bank
		@bank_name = params[:bank_name] if params[:bank_name].present?
		@commissions = Commission.where(bank_name: @bank_name).where(excercise_year_id: current_excercise.id)
		@commissions = @commissions.where(user_id: get_main_admin(current_user))

		@total_montant_credit = @commissions.sum(:amount_credit)
    	@total_commission_apporteur = @commissions.sum(:contributor_commission)
    	@total_commission_nette_company = @commissions.sum(:producer_commission)
    	@total_commission_producteur = @commissions.sum(:company_commission)


		
	end

	# GET /commissions/1
	# GET /commissions/1.json
	def show
	end

	# GET /commissions/new
	def new
		@commission = Commission.new
	end

	# GET /commissions/1/edit
	def edit
	end

	# POST /commissions
	# POST /commissions.json
	def create
		@commission = Commission.new(commission_params)
		@commission.excercise_year_id = current_excercise.id

		respond_to do |format|
		if @commission.save
			format.html { redirect_to @commission, notice: 'Commission was successfully created.' }
			format.json { render :show, status: :created, location: @commission }
		else
			format.html { render :new }
			format.json { render json: @commission.errors, status: :unprocessable_entity }
		end
		end
	end

	# PATCH/PUT /commissions/1
	# PATCH/PUT /commissions/1.json
	def update
		respond_to do |format|
		if @commission.update(commission_params)
			format.html { redirect_to @commission, notice: 'Commission was successfully updated.' }
			format.json { render :show, status: :ok, location: @commission }
		else
			format.html { render :edit }
			format.json { render json: @commission.errors, status: :unprocessable_entity }
		end
		end
	end

  # DELETE /commissions/1
  # DELETE /commissions/1.json
  def destroy
    @commission.destroy
    respond_to do |format|
      format.html { redirect_to commissions_url, notice: 'Commission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commission
      @commission = Commission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def commission_params
      params.require(:commission).permit(:bank_name, :contributor_name, :producer_name, :amount)
	end
	
	# Computing all commissions.
	def compute_commissions

		# Load the current admin user old comissions and we delete there after.
		commission = current_user.commissions

		# Deleting the olds commissions before compute the news
		commission.delete_all if commission.present?
		
		# Load all credits.
		@credits = current_user.credits 

		# Explore credits.
		@credits.each do |credit|

			# Instance of Commission.
			commission = Commission.new

			# Get company infos required infos for the compute.
			if  current_user.app_config.company.present?
				company_name = current_user.app_config.company.name 
				company_commission_net = 0.0
			end
			
			# Get contributor required infos for the compute.
			if credit.contributor_name.present?
				contributor_name = credit.contributor_name 
				contributor = User.find_by(full_name: contributor_name)
				if contributor.present? && contributor.commission_setting.present?
					contributor_commission_percentage = contributor.commission_setting.commission_percentage 
					contributor_hypoplus_commission_percentage = contributor.commission_setting.hypoplus_commission_percentage 
					contributor_commission = 0.0
				end
			end
			
			# Get producer required infos for the compute.
			if credit.producer_name.present?
				producer_name = credit.producer_name 
				producer = User.find_by(full_name: producer_name)

				if producer.present? && producer.commission_setting.present?
					producer_commission_percentage = producer.commission_setting.commission_percentage
					producer_hypoplus_commission_percentage = producer.commission_setting.hypoplus_commission_percentage 
					producer_commission = 0.0
				end
			end

			# Get bank infos required infos for the compute.
			if credit.bank_name.present?
				bank_name = credit.bank_name 
				bank = Bank.find_by(name: bank_name)

				if bank.present? && bank.commission_percentage.present?
					bank_commission_percentage = bank.commission_percentage 
					bank_hypoplus_commission_percentage = bank.hypoplus_commission_percentage 
					bank_amount_commission = 0.0
				end
			end
			
			# Get company infos required infos for the compute.
			if  current_user.app_config.company.present?
				company_name = current_user.app_config.company.name 
				company_commission_net = 0.0
			end

			if credit.amount.present?
				credit_amount = credit.amount 
			end

			# Compute producer commission
			# Rule 1
			if contributor_name == company_name || producer_name == company_name || contributor_name.blank?
				contributor_commission = 0.0
				producer_commission = 0.0
				bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
				company_commission_net = bank_amount_commission
			else
				if contributor_commission_percentage.present? && producer_commission_percentage.present? && bank_commission_percentage.present?
					contributor_commission = (credit_amount * contributor_commission_percentage) / 100
					producer_commission = (credit_amount * producer_commission_percentage) / 100
					bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
					company_commission_net = bank_amount_commission - producer_commission - contributor_commission
				end
			end

			# Rule 2 
			if contributor_name ==  producer_name 
				if contributor_commission_percentage.present? && producer_commission_percentage.present? && bank_commission_percentage.present?

					contributor_commission = 0.0
					producer_commission = (credit_amount * producer_commission_percentage) / 100
					bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
					company_commission_net = bank_amount_commission - producer_commission - contributor_commission
				end
			else
				if contributor_commission_percentage.present? && producer_commission_percentage.present? && bank_commission_percentage.present?

					contributor_commission = (credit_amount * contributor_commission_percentage) / 100
					producer_commission = (credit_amount * producer_commission_percentage) / 100
					bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
					company_commission_net = bank_amount_commission - producer_commission - contributor_commission
				end
			end

			# Rule 3 
			if contributor_name.present? && contributor_name != producer_name  && contributor_name != company_name
				if contributor_commission_percentage.present? && producer_commission_percentage.present? && bank_commission_percentage.present?
					
					producer_commission = (credit_amount * producer_commission_percentage) / 100
					bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
					company_commission_net = bank_amount_commission - producer_commission - contributor_commission
					contributor_commission = (company_commission_net / 2 )+ (producer_commission / 2)
				end

			elsif producer_name ==  company_name || producer_name.blank?
				if contributor_commission_percentage.present? && producer_commission_percentage.present? && bank_commission_percentage.present?
					contributor_commission = (credit_amount * contributor_commission_percentage) / 100
					producer_commission = (credit_amount * producer_commission_percentage) / 100
					bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
					company_commission_net = bank_amount_commission - producer_commission - contributor_commission
					company_commission_net = company_commission_net - contributor_commission
				end
			else
				if contributor_commission_percentage.present? && producer_commission_percentage.present? && bank_commission_percentage.present?

					contributor_commission = (credit_amount * contributor_commission_percentage) / 100
					producer_commission = (credit_amount * producer_commission_percentage) / 100
					bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
					company_commission_net = bank_amount_commission - producer_commission - contributor_commission
				end
			end
			
			
			commission.credit_id = credit.credit_id
			commission.production_date = credit.production_date
			commission.acte_date = credit.acte_date
			commission.customer_id = credit.customer_id
			commission.contributor_name = contributor_name
			commission.contributor_commission = contributor_commission
			commission.contributor_commission_percentage = contributor_commission_percentage
			commission.producer_name = producer_name
			commission.producer_commission = producer_commission
			commission.producer_commission_percentage = producer_commission_percentage
			commission.bank_name = bank_name
			commission.bank_commission = bank_amount_commission
			commission.bank_commission_percentage = bank_commission_percentage
			commission.company_commission = company_commission_net
			commission.notary_name = credit.notary_name
			commission.amount_credit = credit_amount
			commission.user_id = current_user.id
			commission.save

    	end
	end
end
