class PaymentTimetableDetailsController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_payment_timetable_detail, only: [:show, :edit, :update, :destroy]

  # GET /payment_timetable_details
  # GET /payment_timetable_details.json
  def index
    @payment_timetable_details = PaymentTimetableDetail.all
  end



  def producer_payment_timetable_details
    
    query = params[:id] 
	
		calculate_payment_installment(query, "producer")
		@borderaus = Borderau.where(credit_identifier: query)

  end

  def contributor_payment_timetable_details
    
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
	

  

  # GET /payment_timetable_details/new
  def new
    @payment_timetable_detail = PaymentTimetableDetail.new
  end


  def edit 
    puts "IN EDIT #{@query}"
  end
  
  # POST /payment_timetable_details
  # POST /payment_timetable_details.json
  def create
    @payment_timetable_detail = PaymentTimetableDetail.new(payment_timetable_detail_params)

    respond_to do |format|
      if @payment_timetable_detail.save
        format.html { redirect_to @payment_timetable_detail, notice: 'Payment timetable detail was successfully created.' }
        format.json { render :show, status: :created, location: @payment_timetable_detail }
      else
        format.html { render :new }
        format.json { render json: @payment_timetable_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_timetable_details/1
  # PATCH/PUT /payment_timetable_details/1.json
  def update
    respond_to do |format|
      if @payment_timetable_detail.update(payment_timetable_detail_params)


        format.html { redirect_to show_producer_payment_timetable_details_path(PaymentTimetable.find(@payment_timetable_detail.payment_timetable_id).credit_identifier), notice: 'Payment timetable detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment_timetable_detail }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @payment_timetable_detail.errors, status: :unprocessable_entity }
        format.js

      end
    end
  end


  def delete
    @payment_timetable_detail = PaymentTimetableDetail.find(params[:payment_timetable_detail_id])
  end

  # DELETE /payment_timetable_details/1
  # DELETE /payment_timetable_details/1.json
  def destroy
    @payment_timetable_detail.destroy
    respond_to do |format|
      format.html { redirect_to payment_timetable_details_url, notice: 'Payment timetable detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_timetable_detail
      @payment_timetable_detail = PaymentTimetableDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_timetable_detail_params
      params.require(:payment_timetable_detail).permit(:installment_payment, :installment_date, :commission, :cumulative_amount, :paid_by_bank, :paid_to_contributor_or_producer)
    end



    #Calculate payments installment
		def calculate_payment_installment(query, target)
			#payment_timetable_details = PaymentTimetableDetail.find_by(creditUid: query)
			payment_timetable = PaymentTimetable.where(["credit_identifier = ? AND excercise_year_id = ? AND target = ?", query, current_excercise.id, target]).take
			#@credit = Credit.find_by(credit_id: query)
			@credit = Credit.where(["identifier = ? AND excercise_year_id = ?",  query, current_excercise.id]).take
	
				unless payment_timetable.present?

					puts "DANS LE UNLESS"
					#@commission = Commission.find_by(credit_id: query)
					@commission = Commission.where(["credit_identifier = ? AND excercise_year_id = ?", query, current_excercise.id]).take
          
          puts "COMMISSION #{@commission.id} #{@commission.amount_credit}"
					credit_acte_date = @commission.acte_date
          
          if @commission.present? && @credit.present? && credit_acte_date.present?
						bank_name = @commission.bank_name
						puts "UNE COMMISSION EST PRESENTE"

						if bank_name.present?
							puts "BANQUE PRESENTE #{bank_name}"
							bank = Bank.find_by(name: bank_name)
							#bank = Bank.where(["name = ? AND excercise_year_id = ?",  bank_name, current_excercise.id]).take

              if bank.present?
                puts "IN BANK"


                current_bank_settings = bank.bank_settings.where(excercise_year_id: current_excercise.id).take
                
                puts "BANK SETTINGS: #{current_bank_settings.inspect}"
								bank_commission_percentage = current_bank_settings.commission_percentage 
								bank_hypoplus_commission_percentage = current_bank_settings.hypoplus_commission_percentage
								bank_first_installment = current_bank_settings.first_installment
								bank_number_of_dates = current_bank_settings.number_of_dates
                
                contributor_commission = @commission.contributor_commission 
								producer_commission = @commission.producer_commission
								company_commission = @commission.company_commission
								remaining_installment = 100 - bank_first_installment

								if bank_number_of_dates.present? && bank_first_installment.present? #&& contributor_commission.present?
								#if bank_number_of_dates.present? && bank_first_installment.present? && contributor_commission.present?
									#if bank_number_of_dates > 0 && bank_first_installment > 0 && contributor_commission > 0.0 --> old
									if bank_number_of_dates > 0 && bank_first_installment > 0 #&& contributor_commission > 0.0

									
									#first_installment_commission = (contributor_commission  * bank_first_installment)/100 

									if target == "producer"
										first_installment_commission = (producer_commission  * bank_first_installment)/100
										others_installment_commission = (producer_commission * (remaining_installment  / bank_number_of_dates))/100

									elsif target == "contributor"
										first_installment_commission = (contributor_commission  * bank_first_installment)/100
										others_installment_commission = (contributor_commission * (remaining_installment  / bank_number_of_dates))/100

									elsif target == "company"
										first_installment_commission = (company_commission  * bank_first_installment)/100
										others_installment_commission = (company_commission * (remaining_installment  / bank_number_of_dates))/100

									end
									

									#others_installment_commission = (contributor_commission * (remaining_installment  / bank_number_of_dates))/100
                  
                  
                  # Create payment timetable.
                  payment_timetable = PaymentTimetable.new
                  payment_timetable.credit_identifier = query 
                  payment_timetable.excercise_year_id = current_excercise.id
                  payment_timetable.target = target

                  if payment_timetable.save


                    # First installment.
                    payment_timetable_detail = PaymentTimetableDetail.new
                    payment_timetable_detail.installment_payment = "Première tranche" 
                    #payment_timetable_details.installment_date = Date.today
                    payment_timetable_detail.installment_date = credit_acte_date
                    payment_timetable_detail.commission = first_installment_commission 
                    payment_timetable_detail.cumulative_amount = 0.0
                    payment_timetable_detail.paid_by_bank = "Non" 
                    payment_timetable_detail.paid_to_contributor_or_producer = "Non" 
                    #payment_timetable_details.credit_identifier = query
                    #payment_timetable_details.credit_id = @credit.id
                    #payment_timetable_details.excercise_year_id = current_excercise.id
                    payment_timetable_detail.payment_timetable_id = payment_timetable.id

                    payment_timetable_detail.save

                    # Others installment.
                    cumulative_amount = 0.0
                    bank_number_of_dates.times do |i|
                      i  = i + 1
                      
                      
                      cumulative_amount =  cumulative_amount + others_installment_commission
                      
                      payment_timetable_details = PaymentTimetableDetail.new
                      payment_timetable_details.installment_payment = "Echéance " + i.to_s
                      #payment_timetable_details.installment_date = Date.today + i.month
                      payment_timetable_details.installment_date = credit_acte_date + i.month
                      payment_timetable_details.commission = others_installment_commission
                      payment_timetable_details.cumulative_amount =  first_installment_commission + cumulative_amount
                      payment_timetable_details.paid_by_bank = "Non" 
                      payment_timetable_details.paid_to_contributor_or_producer = "Non" 
                      #payment_timetable_details.credit_identifier = query
                      #payment_timetable_details.credit_id = @credit.id
                      #payment_timetable_details.excercise_year_id = current_excercise.id
                      payment_timetable_details.payment_timetable_id = payment_timetable.id
                      payment_timetable_details.save

                    end
                  end
								end
							end
							end
						end	
					end
        end
        
        payment_timetable = PaymentTimetable.find_by(["credit_identifier = ? AND excercise_year_id = ? AND target = ?", query, current_excercise.id, target])

        if payment_timetable
				  @payment_timetable_details = PaymentTimetableDetail.where(payment_timetable_id: payment_timetable.id).reorder('id ASC')
				  #@payment_timetable_detailss = PaymentTimetableDetail.where(creditUid: query).reorder('installment_date ASC')
        end
    end

end
