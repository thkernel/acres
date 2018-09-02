class CreditDetailsController < ApplicationController
  # This controller is reserved for all user authenticate users
  before_action :authenticate_user!
  
  before_action :set_credit_detail, only: [:show, :edit, :update, :destroy]
  layout "dashboard"

  # GET /credit_details
  # GET /credit_details.json
  def producer_credit_details
    
    query = params[:id] 
	
	credit_detail = CreditDetail.find_by(creditUid: query)
	@credit = Credit.find_by(credit_id: query)
	unless credit_detail.present?

		
		@commission = Commission.find_by(credit_id: query)
		
		if @commission.present? && @credit.present?
			bank_name = @commission.bank_name
			
			if bank_name.present?
				bank = Bank.find_by(name: bank_name)
				if bank.present?
					bank_commission_percentage = bank.commission_percentage 
					bank_hypoplus_commission_percentage = bank.hypoplus_commission_percentage
					bank_first_installment = bank.first_installment
					bank_number_of_dates = bank.number_of_dates
					producer_commission = @commission.producer_commission 
					remaining_installment = 100 - bank_first_installment

					if bank_number_of_dates > 0 && bank_first_installment > 0 && producer_commission > 0.0
						
						first_installment_commission = (producer_commission  * bank_first_installment)/100
						others_installment_commission = (producer_commission * (remaining_installment  / bank_number_of_dates))/100
						
						# First installment.
						credit_detail = CreditDetail.new
						credit_detail.installment_payment = "Première tranche " 
						credit_detail.installment_date = Date.today
						credit_detail.commission = first_installment_commission 
						credit_detail.cumulative_amount = 0.0
						credit_detail.paid_by_bank = "Non" 
						credit_detail.paid_to_contributor_or_producer = "Non" 
						credit_detail.creditUid = query
						credit_detail.credit_id = @credit.id
						credit_detail.save

						# Others installment.
						cumulative_amount = 0.0
						bank_number_of_dates.times do |i|
							i  = i + 1
							
							 
							cumulative_amount =  cumulative_amount + others_installment_commission
							
							credit_detail = CreditDetail.new
							credit_detail.installment_payment = "Echéance " + i.to_s
							credit_detail.installment_date = Date.today + i.month
							credit_detail.commission = others_installment_commission
							credit_detail.cumulative_amount =  first_installment_commission + cumulative_amount
							credit_detail.paid_by_bank = "Non" 
							credit_detail.paid_to_contributor_or_producer = "Non" 
							credit_detail.creditUid = query
							credit_detail.credit_id = @credit.id
							credit_detail.save

						end
					end
				end
			end	
		end
	end
	@credit_details = CreditDetail.where(creditUid: query).reorder('id ASC')
  end

  def contributor_credit_details
    
    query = params[:id] 
	
	credit_detail = CreditDetail.find_by(creditUid: query)
	@credit = Credit.find_by(credit_id: query)
	unless credit_detail.present?

		
		@commission = Commission.find_by(credit_id: query)
		
		if @commission.present? && @credit.present?
			bank_name = @commission.bank_name
			
			if bank_name.present?
				bank = Bank.find_by(name: bank_name)
				if bank.present?
					bank_commission_percentage = bank.commission_percentage 
					bank_hypoplus_commission_percentage = bank.hypoplus_commission_percentage
					bank_first_installment = bank.first_installment
					bank_number_of_dates = bank.number_of_dates
					contributor_commission = @commission.contributor_commission 
					remaining_installment = 100 - bank_first_installment

					if bank_number_of_dates > 0 && bank_first_installment > 0 && contributor_commission > 0.0
						
						first_installment_commission = (contributor_commission  * bank_first_installment)/100
						others_installment_commission = (contributor_commission * (remaining_installment  / bank_number_of_dates))/100
						
						# First installment.
						credit_detail = CreditDetail.new
						credit_detail.installment_payment = "Première tranche " 
						credit_detail.installment_date = Date.today
						credit_detail.commission = first_installment_commission 
						credit_detail.cumulative_amount = 0.0
						credit_detail.paid_by_bank = "Non" 
						credit_detail.paid_to_contributor_or_producer = "Non" 
						credit_detail.creditUid = query
						credit_detail.credit_id = @credit.id
						credit_detail.save

						# Others installment.
						cumulative_amount = 0.0
						bank_number_of_dates.times do |i|
							i  = i + 1
							
							 
							cumulative_amount =  cumulative_amount + others_installment_commission
							
							credit_detail = CreditDetail.new
							credit_detail.installment_payment = "Echéance " + i.to_s
							credit_detail.installment_date = Date.today + i.month
							credit_detail.commission = others_installment_commission
							credit_detail.cumulative_amount =  first_installment_commission + cumulative_amount
							credit_detail.paid_by_bank = "Non" 
							credit_detail.paid_to_contributor_or_producer = "Non" 
							credit_detail.creditUid = query
							credit_detail.credit_id = @credit.id
							credit_detail.save

						end
					end
				end
			end	
		end
	end
	@credit_details = CreditDetail.where(creditUid: query).reorder('id ASC')
  end

  # GET /credit_details/1
  # GET /credit_details/1.json
  def show
  end

  # GET /credit_details/new
  def new
    @credit_detail = CreditDetail.new
  end

  # GET /credit_details/1/edit
  def edit
  end

  # POST /credit_details
  # POST /credit_details.json
  def create
    @credit_detail = CreditDetail.new(credit_detail_params)

    respond_to do |format|
      if @credit_detail.save
        format.html { redirect_to @credit_detail, notice: 'Credit detail was successfully created.' }
        format.json { render :show, status: :created, location: @credit_detail }
		    format.js
	else
        format.html { render :new }
        format.json { render json: @credit_detail.errors, status: :unprocessable_entity }
		format.js
	end
    end
  end

  # PATCH/PUT /credit_details/1
  # PATCH/PUT /credit_details/1.json
  def update
    respond_to do |format|
      if @credit_detail.update(credit_detail_params)
        @credit_details = CreditDetail.where(creditUid: @credit_detail.creditUid).reorder('id ASC')
        format.html { redirect_to @credit_detail, notice: 'Credit detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @credit_detail }
		    format.js
  else

        format.html { render :edit }
        format.json { render json: @credit_detail.errors, status: :unprocessable_entity }
		  format.js
	end
    end
  end

  # DELETE /credit_details/1
  # DELETE /credit_details/1.json
  def destroy
    @credit_detail.destroy
    respond_to do |format|
      format.html { redirect_to credit_details_url, notice: 'Credit detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit_detail
      @credit_detail = CreditDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_detail_params
      params.require(:credit_detail).permit(:installment_payment, :installment_date, :commission, :cumulative_amount, :paid_by_bank, :paid_to_contributor_or_producer)
    end
end
