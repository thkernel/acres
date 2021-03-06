class CreditDetailsController < ApplicationController
  # This controller is reserved for all user authenticate users
	before_action :authenticate_user!
	before_action :current_excercise_year

  
  before_action :set_credit_detail, only: [:show, :edit, :update, :destroy]
  layout "dashboard"


	
	def download_bordereau
		send_file(
			"#{Rails.root}/public/exportations/bordereaux/#{params[:file_name]}.xlsx",
			filename: "#{params[:file_name]}.xlsx",
			type: "application/xlsx"
		)
	end

  # GET /credit_details
  # GET /credit_details.json
  def producer_credit_details
    
    query = params[:id] 
	
		calculate_payment_installment(query, "producer")
		@borderaus = Borderau.where(credit_identifier: query)

  end

  def contributor_credit_details
    
    query = params[:id] 
		calculate_payment_installment(query, "contributor")
		@borderaus = Borderau.where(credit_identifier: query)
	end
	

	def credit_payments_details
   
    query = params[:id] 
		calculate_payment_installment(query, 'producer')
		calculate_payment_installment(query, 'contributor')
		calculate_payment_installment(query, 'company')
		calculate_payment_installment(query, 'co-courtier')
	
	end
	

	def edit_all_credit_payments_details
		credit_identifier = params[:credit]
		@credit = Credit.find_by(identifier: credit_identifier)
		@credit_details = CreditDetail.where(["credit_identifier = ? AND excercise_year_id = ?", credit_identifier, current_excercise.id]).reorder('id ASC')
	end


	def update_all_credit_payments_details
		params['credit_details'].keys.each do |id|
			@credit_detail = CreditDetail.find(id.to_i)
			
			@credit_detail.update_attributes(update_all_credit_detail_params(id))

		end
		bank = Bank.find_by(name: Credit.find_by(identifier: @credit_detail.credit_identifier).bank_name)
		redirect_to bank_credits_path(bank.id)

	
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
		@credit_detail.excercise_year_id = current_excercise.id
		

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
        @credit_details = CreditDetail.where(["credit_identifier = ? AND excercise_year_id = ?",  @credit_detail.credit_identifier, current_excercise.id]).reorder('id ASC')
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


		#For bulk update.
		def update_all_credit_detail_params(id)
      params.require(:credit_details).fetch(id).permit(:installment_payment, :installment_date, :commission, :cumulative_amount, :paid_by_bank, :paid_to_contributor_or_producer)
		end
		

		#Calculate payments installment
		def calculate_payment_installment(query, target)
			#credit_detail = CreditDetail.find_by(credit_identifier: query)
			credit_detail = CreditDetail.where(["credit_identifier = ? AND excercise_year_id = ?", query, current_excercise.id]).take
			#@credit = Credit.find_by(credit_id: query)
			@credit = Credit.where(["identifier = ? AND excercise_year_id = ?",  query, current_excercise.id]).take
	
				unless credit_detail.present?

					puts "DANS LE UNLESS"
					#@commission = Commission.find_by(credit_id: query)
					@commission = Commission.where(["credit_identifier = ? AND excercise_year_id = ?", query, current_excercise.id]).take
					puts "COMMISSION #{@commission.id} #{@commission.amount_credit}"
					credit_acte_date = @commission.acte_date

					if @commission.present? && @credit.present? && credit_acte_date.present?
						bank_name = @commission.bank_name
						puts "UNE COMMISSION EST PRESENTE #{bank_name}"

						if bank_name.present?
							puts "BANQUE PRESENTE #{bank_name}"
							bank = Bank.find_by(name: bank_name)
							#bank = Bank.where(["name = ? AND excercise_year_id = ?",  bank_name, current_excercise.id]).take

							if bank.present?

								puts "IN BANK "
								#bank_commission_percentage = bank.commission_percentage 
								bank_commission_percentage = current_bank_setting(bank).commission_percentage 
								
								#bank_hypoplus_commission_percentage = bank.hypoplus_commission_percentage
								bank_hypoplus_commission_percentage = current_bank_setting(bank).hypoplus_commission_percentage

								#bank_first_installment = bank.first_installment
								bank_first_installment = current_bank_setting(bank).first_installment

								#bank_number_of_dates = bank.number_of_dates
								bank_number_of_dates = current_bank_setting(bank).number_of_dates

								contributor_commission = @commission.contributor_commission 
								producer_commission = @commission.producer_commission
								bank_commission = @commission.bank_commission
								company_commission = @commission.company_commission
								remaining_installment = 100 - bank_first_installment

								if bank_number_of_dates.present? && bank_first_installment.present? #&& contributor_commission.present?
								#if bank_number_of_dates.present? && bank_first_installment.present? && contributor_commission.present?
									#if bank_number_of_dates > 0 && bank_first_installment > 0 && contributor_commission > 0.0 --> old
									if bank_number_of_dates > 0 && bank_first_installment > 0 #&& contributor_commission > 0.0

									
									#first_installment_commission = (contributor_commission  * bank_first_installment)/100 

									if target == "producer"
										first_installment_commission = (bank_commission  * bank_first_installment)/100
										others_installment_commission = (bank_commission * (remaining_installment  / bank_number_of_dates))/100

									elsif target == "contributor"
										first_installment_commission = (bank_commission  * bank_first_installment)/100
										others_installment_commission = (bank_commission * (remaining_installment  / bank_number_of_dates))/100

									elsif target == "company"
										first_installment_commission = (bank_commission  * bank_first_installment)/100
										others_installment_commission = (bank_commission * (remaining_installment  / bank_number_of_dates))/100

									end
									

									#others_installment_commission = (contributor_commission * (remaining_installment  / bank_number_of_dates))/100
									
									# First installment.
									credit_detail = CreditDetail.new
									credit_detail.installment_payment = "Première tranche " 
									#credit_detail.installment_date = Date.today
									credit_detail.installment_date = credit_acte_date
									credit_detail.commission = first_installment_commission.round(2) if first_installment_commission
									credit_detail.cumulative_amount = 0.0
									credit_detail.paid_by_bank = "Non" 
									credit_detail.paid_to_contributor_or_producer = "Non" 
									credit_detail.credit_identifier = query
									credit_detail.credit_id = @credit.id
									credit_detail.excercise_year_id = current_excercise.id
									credit_detail.save

									# Others installment.
									cumulative_amount = 0.0
									bank_number_of_dates.times do |i|
										i  = i + 1
										
										
										cumulative_amount =  cumulative_amount + others_installment_commission
										
										credit_detail = CreditDetail.new
										credit_detail.installment_payment = "Echéance " + i.to_s
										#credit_detail.installment_date = Date.today + i.month
										credit_detail.installment_date = credit_acte_date + i.month
										credit_detail.commission = others_installment_commission.round(2) if others_installment_commission
										credit_detail.cumulative_amount =  (first_installment_commission + cumulative_amount).round(2)
										credit_detail.paid_by_bank = "Non" 
										credit_detail.paid_to_contributor_or_producer = "Non" 
										credit_detail.credit_identifier = query
										credit_detail.credit_id = @credit.id
										credit_detail.excercise_year_id = current_excercise.id
										credit_detail.save

									end
								end
							end
							end
						end	
					end
				end
				@credit_details = CreditDetail.where(["credit_identifier = ? AND excercise_year_id = ?", query, current_excercise.id]).reorder('id ASC')
				#@credit_details = CreditDetail.where(credit_identifier: query).reorder('installment_date ASC')

		end

		

end
