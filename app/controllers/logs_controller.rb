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

  def reset 
  end

  def reset_all 
	# Delete all bank.
	Bank.destroy_all
	producers = User.find_by_role("Producteur")
	producers.destroy_all
	
	contributors = User.find_by_role("Apporteur")
	contributors.destroy_all
	Credit.destroy_all
	Commission.destroy_all
	Customer.destroy_all

	respond_to do |format|
		format.html { redirect_to dashboard_path, notice: 'Données supprimées avec succès!' }
		format.json { head :no_content }
		format.js
	  end

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

	
end
