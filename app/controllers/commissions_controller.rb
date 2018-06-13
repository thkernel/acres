class CommissionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_commission, only: [:show, :edit, :update, :destroy]
  after_action  :compute_commissions
  layout "dashboard"




  def contributors

    # Load all commissions
    @commissions = Commission.all
  end

  def producers
    @commissions = Commission.all
  end

  def banks
	@commissions = Commission.all
  end

  def company 
	@commissions = Commission.all
  end
  # GET /commissions
  # GET /commissions.json
  def index
    @commissions = Commission.all
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
	
	def compute_commissions
		Commission.delete_all
		# Load all credits.
		@credits = Credit.all  

		# Loop credits.
		@credits.each {|credit|

			# Commissions.
			commission = Commission.new

			# Get credit infos.
			credit_contributor_name = credit.contributor_name if credit.contributor_name.present?
			contributor = User.find_by(full_name: credit.contributor_name)
			
			credit_producer_name = credit.producer_name if credit.producer_name.present?
			producer = User.find_by(full_name: credit_producer_name)
			
			credit_bank_name = credit.bank_name if credit.bank_name.present?
			bank = Bank.find_by(name: credit_bank_name)

			if producer.present?
				producer_commission_percentage = producer.commission_setting.commission_percentage
				commission.producer_name = credit_producer_name
				commission.producer_commission_percentage = producer_commission_percentage
				credit_amount = credit.amount if credit.amount.present?
				if producer.commission_setting.present?
				commission.producer_commission = (((producer_commission_percentage) * (credit.amount))/100)
				end
			
			end
			
			if contributor.present?
				contributor_commission_percentage = contributor.commission_setting.commission_percentage
				commission.contributor_name = credit_contributor_name
				commission.contributor_commission_percentage = contributor_commission_percentage
				credit_amount = credit.amount if credit.amount.present?
				if contributor.commission_setting.present?
				commission.contributor_commission = (((contributor_commission_percentage) * (credit.amount))/100)
				end
			
			end

			if bank.present?
				bank_commission_percentage = bank.commission_percentage
				commission.bank_name = credit_bank_name
				commission.bank_commission_percentage = bank_commission_percentage
				credit_amount = credit.amount if credit.amount.present?
				if bank.commission_percentage.present?
				commission.bank_commission = (((bank_commission_percentage) * (credit.amount))/100)
				end
			
			end

			if current_user.role == 'Admin'
				if current_user.company.present?
					company_commission_percentage = current_user.company.percentage_commission if current_user.company.percentage_commission.present?
					commission.company_commission = (((company_commission_percentage) * (credit.amount))/100)
				end
			end
			
			commission.amount_credit = credit_amount
			commission.save

    	}
	end
end
