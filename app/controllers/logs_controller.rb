class LogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_log, only: [:show, :edit, :update, :destroy]
  helper LogsHelper
  layout "dashboard"


  # GET /logs
  # GET /logs.json
  def index
    @logs = Log.order('created_at DESC')
  end

  # GET /logs/1
  # GET /logs/1.json
  def show
  end

  # GET /logs/new
  def new
    @log = Log.new
  end

  # GET /logs/1/edit
  def edit
  end

  # POST /logs
  # POST /logs.json
  def create
	file = params[:log][:file_name]
	
    respond_to do |format|
	  if Log.import?(file, current_user)
		
		# Now we are sure that the importation was succefull.
		#compute_commissions

		# Populate commissions.
		populate_commission
		handle_commissions

		# We refresh page.
        format.html { redirect_to @log, notice: 'Log was successfully created.' }
        format.json { render :show, status: :created, location: @log }
        format.js
      else
        format.html { render :new }
        format.json { render json: @log.errors, status: :unprocessable_entity }
        format.js
      end
    end
    @logs = Log.all

  end

  # PATCH/PUT /logs/1
  # PATCH/PUT /logs/1.json
  def update
    respond_to do |format|
      if @log.update(log_params)
        format.html { redirect_to @log, notice: 'Log was successfully updated.' }
        format.json { render :show, status: :ok, location: @log }
      else
        format.html { render :edit }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logs/1
  # DELETE /logs/1.json
  def destroy
    @log.destroy
    respond_to do |format|
      format.html { redirect_to logs_url, notice: 'Log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log
      @log = Log.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def log_params
      params.require(:log).permit(:file_name, :no_record, :error, :status)
	end
	


	# Handle commissions.
	def handle_commissions

		# Initialize
		producer_commission_percentage = 0.0
		contributor_commission_percentage = 0.0
		bank_commission_percentage = 0.0
		company_commission_percentage = 0.0

		credit_amount = 0.0

		company_commission_net = 0.0
		producer_commission = 0.0
		contributor_commission = 0.0
		bank_amount_commission = 0.0
	

		bank_hypoplus_commission_percentage = 0.0
		contributor_hypoplus_commission_percentage = 0.0
		producer_hypoplus_commission_percentage = 0.0

		# Getting company infos.
		if  current_company.present?
			company_name = current_company.name.downcase
		end
		# Load all commissions.
		commissions = Commission.all

		# For each commissions
		commissions.each do |commission|

			# Credit amount.
			if commission.amount_credit.present?
				credit_amount = commission.amount_credit 
			end

			# We get the bank infos.
			if commission.bank_name
				bank = Bank.find_by_name(commission.bank_name)
			end
			if bank.present? && bank.commission_percentage.present?
				puts "BANQUE NAME: #{bank.name} et #{bank.commission_percentage}"
				# Get bank infos required infos for the compute.
				bank_commission_percentage = bank.commission_percentage 
			end

			if bank.present? && bank.hypoplus_commission_percentage.present?
				bank_hypoplus_commission_percentage = bank.hypoplus_commission_percentage 
			end

			# We get the producer infos.
			contributor_name = commission.contributor_name.downcase
			producer_name = commission.producer_name.downcase
		
			# Get contributor.
			if contributor_name.present?
				contributor = User.find_user_by_name_and_role(contributor_name, 'Apporteur').first
					if contributor.present? && contributor.commission_setting.present?
						contributor_commission_percentage = contributor.commission_setting.commission_percentage 
						contributor_hypoplus_commission_percentage = contributor.commission_setting.hypoplus_commission_percentage 
						
					end
				puts "Apporteur: #{contributor_name} et #{contributor_commission_percentage}"
			end
					
			# Get producer.
			if producer_name.present?
				producer = User.find_user_by_name_and_role(producer_name, 'Producteur').first
		
				if producer.present? && producer.commission_setting.present? 
					producer_commission_percentage = producer.commission_setting.commission_percentage 
					producer_hypoplus_commission_percentage = producer.commission_setting.hypoplus_commission_percentage 
				
				end
				puts "Producteur: #{producer_name} et #{producer_commission_percentage}"
			end

			# Handle 
			if bank_hypoplus_commission_percentage.present? && bank_hypoplus_commission_percentage > 0.0 
					
				if producer_name.present? && producer_hypoplus_commission_percentage.present? && producer_name != company_name 
				contributor_commission_percentage = 0.0 
				contributor_commission = 0.0

		
				bank_amount_commission = (credit_amount * bank_hypoplus_commission_percentage) / 100
				producer_commission = (bank_amount_commission) / 2

				company_commission_net = (bank_amount_commission) / 2
				company_commission_percentage = (company_commission_net / credit_amount) * 100


			else
				contributor_commission_percentage = 0.0 
				contributor_commission = 0.0

				
				bank_amount_commission = (credit_amount * bank_hypoplus_commission_percentage) / 100
				producer_commission = 0.0

				company_commission_net = bank_amount_commission
				company_commission_percentage = (company_commission_net / credit_amount) * 100
		
			end


		else
		
			# Rule 1
			if contributor_name == company_name && producer_name == company_name 
			
				contributor_commission_percentage = 0.0 
				producer_commission_percentage = 0.0
				
				contributor_commission = 0.0
				producer_commission = 0.0

				bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
				company_commission_net = bank_amount_commission
				company_commission_percentage = (company_commission_net / credit_amount) * 100

				puts "REGLE 1"
			end

			# Rule 1 bis
			if contributor_name.blank? && producer_name == company_name 
			
				contributor_commission_percentage = 0.0 
				producer_commission_percentage = 0.0
				
				contributor_commission = 0.0
				producer_commission = 0.0

				bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
				company_commission_net = bank_amount_commission
				company_commission_percentage = (company_commission_net / credit_amount) * 100

				puts "REGLE 1 BIS"
			end

			# Rule 2 - new regle
			if contributor_name.present? &&  contributor_name != company_name && producer_name == company_name
				
				producer_commission = 0.0
				producer_commission_percentage = 0.0

				bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
				contributor_commission = (credit_amount * contributor_commission_percentage) / 100
				company_commission_net = (bank_amount_commission) - (contributor_commission)
				company_commission_percentage = (company_commission_net / credit_amount) * 100
				puts "REGLE 2"

			
			
			end
			

				# Regle 3 - new
			if contributor_name.present? && contributor_name == producer_name && producer_name != company_name
				contributor_commission = 0.0
				contributor_commission_percentage = 0.0 

				producer_commission = (credit_amount * producer_commission_percentage) / 100
				bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
				company_commission_net = (bank_amount_commission) - (producer_commission)
				company_commission_percentage = (company_commission_net / credit_amount) * 100
				puts "REGLE 3"

			end


			# Regle 4 - New
			if contributor_name.present? && contributor_name != producer_name && contributor_name != company_name && producer_name != company_name
				bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
				contributor_commission = (credit_amount * contributor_commission_percentage) / 100
				producer_commission = ((credit_amount * producer_commission_percentage) / 100) - ((contributor_commission * 50)/100)
				company_commission_net = (bank_amount_commission) - (producer_commission) - (contributor_commission)
				company_commission_percentage = (company_commission_net / credit_amount) * 100

				puts "REGLE 4"
			end
			
			
			# Regle 5
			if contributor_name.present? && contributor_name == company_name && producer_name != company_name 
				contributor_commission = 0.0
				contributor_commission_percentage = 0.0

				bank_amount_commission = (credit_amount * bank_commission_percentage) / 100

				producer_commission = ((credit_amount * producer_commission_percentage) / 100) 
				company_commission_net = (bank_amount_commission) - (producer_commission) 
				company_commission_percentage = (company_commission_net / credit_amount) * 100

				puts "REGLE 5"
			end
		end
		
		# Saving.
		commission.customer_id = contributor_commission
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
	
		
		
		
		
		# We get the contributor infos.

		# Begining of commissions computing.
		# Saving

	end
	# Populate commission
	def populate_commission
		# Load the current admin user old comissions and we delete there after.
		#commission = current_user.commissions

		# Deleting the olds commissions before compute the news
		Commission.destroy_all #if commission.present?
		#Credit.destroy_all
		
		# Load all credits.
		@credits = Credit.all
		#@credits = current_user.credits

		# Explore credits.
		@credits.each do |credit|
			# Instance of Commission.
			commission = Commission.new

			commission.credit_id = credit.credit_id
			commission.production_date = credit.production_date
			commission.acte_date = credit.acte_date
			commission.customer_id = credit.customer_id if credit.customer_id
			commission.contributor_name = credit.contributor_name
			#commission.contributor_commission = credit.contributor_commission
			#comission.contributor_commission_percentage = contributor_commission_percentage
			commission.producer_name = credit.producer_name
			#commission.producer_commission = producer_commission
			#comission.producer_commission_percentage = producer_commission_percentage
			commission.bank_name = credit.bank_name
			#commission.bank_commission = bank_amount_commission
			#commission.bank_commission_percentage = bank_commission_percentage
			#commission.company_comission = company_commission_net
			commission.notary_name = credit.notary_name
			commission.amount_credit = credit.amount
			commission.user_id = current_user.id
			commission.save
		end

	end

	# Computing all commissions.
	def compute_commissions

		# Load the current admin user old comissions and we delete there after.
		#commission = current_user.commissions

		# Deleting the olds commissions before compute the news
		Commission.delete_all #if commission.present?
		
		# Load all credits.
		@credits = current_user.credits 

		# Explore credits.
		@credits.each do |credit|

			# Instance of Commission.
			commission = Commission.new

			# Get contributor required infos for the compute.
			credit_contributor_name = credit.contributor_name if credit.contributor_name.present?
			contributor = User.find_by(full_name: credit.contributor_name)
			contributor_commission_percentage = contributor.commission_setting.commission_percentage if contributor.commission_setting.present?
			contributor_hypoplus_commission_percentage = contributor.commission_setting.hypoplus_commission_percentage if contributor.commission_setting.present?
			contributor_commission = 0.0
			
			# Get producer required infos for the compute.
			credit_producer_name = credit.producer_name if credit.producer_name.present?
			producer = User.find_by(full_name: credit_producer_name)
			producer_commission_percentage = producer.commission_setting.commission_percentage if producer.commission_setting.present?
			producer_hypoplus_commission_percentage = producer.commission_setting.hypoplus_commission_percentage if producer.commission_setting.present?
			producer_commission = 0.0

			# Get bank infos required infos for the compute.
			credit_bank_name = credit.bank_name if credit.bank_name.present?
			bank = Bank.find_by(name: credit_bank_name)
			bank_commission_percentage = bank.commission_percentage if bank.commission_percentage.present?
			bank_hypoplus_commission_percentage = bank.hypoplus_commission_percentage if bank.hypoplus_commission_percentage.present?
			bank_amount_commission = 0.0

			credit_company_name = current_user.company.name if  current_user.company.present?
			company_commission_net = 0.0

			credit_amount = credit.amount if credit.amount.presente?

			# Compute producer commission
			# Rule 1
			if contributor_name == credit_company_name || producer_name == credit_company_name || contributor_name.blank?
				contributor_commission = 0.0
				producer_commission = 0.0
				bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
				company_commission_net = bank_amount_commission
			else
				contributor_commission = (credit_amount * contributor_commission_percentage) / 100
				producer_commission = (credit_amount * producer_commission_percentage) / 100
				bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
				company_commission_net = bank_amount_commission - producer_commission - contributor_commission
			end

			# Rule 2 
			if contributor_name ==  producer_name 
				contributor_commission = 0.0
				producer_commission = (credit_amount * producer_commission_percentage) / 100
				bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
				company_commission_net = bank_amount_commission - producer_commission - contributor_commission
			else
				contributor_commission = (credit_amount * contributor_commission_percentage) / 100
				producer_commission = (credit_amount * producer_commission_percentage) / 100
				bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
				company_commission_net = bank_amount_commission - producer_commission - contributor_commission
			end

			# Rule 3 
			if contributor_name != producer_name  && contributor_name != credit_company_name
				contributor_commission = 0.0
				producer_commission = (credit_amount * producer_commission_percentage) / 100
				bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
				company_commission_net = bank_amount_commission - producer_commission - contributor_commission
			elsif producer_name ==  credit_company_name || producer_name.blank?

			else
				contributor_commission = (credit_amount * contributor_commission_percentage) / 100
				producer_commission = (credit_amount * producer_commission_percentage) / 100
				bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
				company_commission_net = bank_amount_commission - producer_commission - contributor_commission
			end
			
			
			commission.credit_id = credit.credit_id
			commission.production_date = credit.production_date
			commission.acte_date = credit.acte_date
			commission.customer_id = credit.customer_id if credit.customer_id
			commission.contributor_name = credit_contributor_name
			commission.contributor_commission = contributor_commission
			comission.contributor_commission_percentage = contributor_commission_percentage
			commission.producer_name = credit_producer_name
			commission.producer_commission = producer_commission
			comission.producer_commission_percentage = producer_commission_percentage
			comission.bank_name = bank_name
			commission.bank_commission = bank_amount_commission
			commission.bank_commission_percentage = bank_commission_percentage
			commission.company_comission = company_commission_net
			commission.notary_name = credit.notary_name
			commission.amount_credit = credit_amount
			commission.user_id = current_user.id
			commission.save

    	end
	end
end
