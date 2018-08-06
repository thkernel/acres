class CommissionsController < ApplicationController
	# This controller is reserved for all user authenticate users
	before_action :authenticate_user!

	# Calling set_commion methode on before action to initialize commissions variable.
	before_action :set_commission, only: [:show, :edit, :update, :destroy]
	
	# Calling compute_commissions methode on after action to compute the commission.
	after_action  :compute_commissions

	

	# Render dashboard layout for all actions.
	layout "dashboard"


	def contributors

		if current_user.present? && is_contributor?(current_user)
			@commissions = Commission.where(contributor_name: current_user.full_name)
		elsif is_admin?
			#@commissions = current_user.commissions 
			users = User.where(role: 'Apporteur')
			@commissions = []
			users.each {|user|
				commissions = Commission.where(contributor_name: user.full_name)
				commissions.each{|commission|
					@commissions.push(commission)
				}
				
			}
		end

		
	end

	def producers
		if current_user.present? && is_producer?(current_user)
			@commissions = Commission.where(producer_name: current_user.full_name)
		elsif is_admin?
			#@commissions = current_user.commissions 
			users = User.where(role: 'Producteur')
			@commissions = []
			users.each {|user|
				commissions = Commission.where(producer_name: user.full_name)
				commissions.each{|commission|
					@commissions.push(commission)
				}
				
			}
		end
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

	def resume_producer
		if params[:producer_name].present?
			@producer_name = params[:producer_name] 
			@commissions = Commission.where(producer_name: @producer_name)
		elsif params[:producer_name].blank?
			@producer_name = current_user.full_name 
			@commissions = Commission.where(producer_name: @producer_name)
		end
		
	end

	def resume_contributor
		if params[:contributor_name].present?
			@contributor_name = params[:contributor_name] 
			@commissions = Commission.where(contributor_name: @contributor_name)
		elsif params[:contributor_name].blank?
			@contributor_name = current_user.full_name 
			@commissions = Commission.where(contributor_name: @contributor_name)
		end
		
	end

	def resume_bank
		@bank_name = params[:bank_name] if params[:bank_name].present?
		@commissions = Commission.where(bank_name: @bank_name)
		
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
		commission = current_user.commissions
		commission.delete_all if commission.present?
		# Load all credits.
		@credits = current_user.credits 

		# Loop credits.
		@credits.each {|credit|

			# Instance of Commission.
			commission = Commission.new

			# Get credit infos.
			credit_contributor_name = credit.contributor_name if credit.contributor_name.present?
			contributor = User.find_by(full_name: credit.contributor_name)
			
			credit_producer_name = credit.producer_name if credit.producer_name.present?
			producer = User.find_by(full_name: credit_producer_name)
			
			credit_bank_name = credit.bank_name if credit.bank_name.present?
			bank = Bank.find_by(name: credit_bank_name)

			credit_company_name = current_user.company.name if  current_user.company.present?


			# Compute producer commission
			if producer.present?
				if producer.commission_setting.present?
					producer_commission_percentage = producer.commission_setting.commission_percentage
					commission.producer_name = credit_producer_name
					commission.producer_commission_percentage = producer_commission_percentage
					credit_amount = credit.amount if credit.amount.present?
					
					
					commission.producer_commission = (((producer_commission_percentage) * (credit.amount))/100)
				end
			
			end
			
			# Compute contributor commission
			if contributor.present?

				if contributor.commission_setting.present?

					contributor_commission_percentage = contributor.commission_setting.commission_percentage
					commission.contributor_name = credit_contributor_name
					commission.contributor_commission_percentage = contributor_commission_percentage
					credit_amount = credit.amount if credit.amount.present?
					
					
					commission.contributor_commission = (((contributor_commission_percentage) * (credit.amount))/100)
				end
			
			end

			# Compute bank commission
			if bank.present?

				if bank.commission_percentage.present?

					bank_commission_percentage = bank.commission_percentage
					commission.bank_name = credit_bank_name
					commission.bank_commission_percentage = bank_commission_percentage
					credit_amount = credit.amount if credit.amount.present?
					
					
					commission.bank_commission = (((bank_commission_percentage) * (credit.amount))/100)
				end
			
			end

			# Compute company commission.
			if current_user.role == 'Admin'
				if current_user.company.present?
					if current_user.company.percentage_commission.present? && credit_company_name.present? 
						if  credit_contributor_name == credit_company_name || credit_producer_name == credit_company_name || !credit_contributor_name.prensent?
							company_commission_percentage = current_user.company.percentage_commission 
							commission.company_commission = (((company_commission_percentage) * (credit.amount))/100)
						else
							company_commission_percentage = current_user.company.percentage_commission 
							commission.company_commission = (((company_commission_percentage) * (credit.amount))/100)
					
						end
					end
				end
			end
			
			commission.credit_id = credit.credit_id
			commission.production_date = credit.production_date
			commission.acte_date = credit.acte_date
			commission.customer_id = credit.customer_id
			commission.notary_name = credit.notary_name
			commission.amount_credit = credit_amount
			commission.user_id = current_user.id
			commission.save

    	}
	end
end
