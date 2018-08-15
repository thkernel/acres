class LogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_log, only: [:show, :edit, :update, :destroy]
  helper LogsHelper
  layout "dashboard"


  # GET /logs
  # GET /logs.json
  def index
    @logs = current_user.logs
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
    @logs = current_user.logs

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
			commission.customer_id = credit.customer_id
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
