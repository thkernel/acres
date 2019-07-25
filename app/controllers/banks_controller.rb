class BanksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bank, only: [:show, :edit, :update, :destroy]
  layout "dashboard"




  # GET /banks
  # GET /banks.json
  def index
   
      @banks = Bank.where(excercise_year_id: current_excercise.id)
    
  end

  # GET /banks/1
  # GET /banks/1.json
  def show
  end

  # GET /banks/new
  def new
    @bank = Bank.new
  end

  # GET /banks/1/edit
  def edit
  end

  # POST /banks
  # POST /banks.json
  def create

    @banks = Bank.all
    @bank = current_user.banks.build(bank_params)

    respond_to do |format|
      if @bank.save
        format.html { redirect_to @bank, notice: 'Bank was successfully created.' }
        format.json { render :show, status: :created, location: @bank }
        format.js
      else
        format.html { render :new }
        format.json { render json: @bank.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /banks/1
  # PATCH/PUT /banks/1.json
  def update
    commission_was_changed = params[:commission_was_changed]

    rate_start_date = params[:rate_start_date]
    old_rate = params[:old_rate]
    new_rate = params[:commission_percentage]

    if commission_was_changed.present? && commission_was_changed == "true"
      if rate_start_date.present?
        
        

        bank_commission_rate_tracker = BankCommissionRateTracker.new
        bank_commission_rate_tracker.start_date = rate_start_date
        bank_commission_rate_tracker.old_rate = old_rate
        bank_commission_rate_tracker.new_rate = params[:bank][:commission_percentage]
        bank_commission_rate_tracker.bank_id =  @bank.id 
        bank_commission_rate_tracker.user_id = current_user.id 
        bank_commission_rate_tracker.save


      else
        respond_to do |format|
          format.html { redirect_to banks_path, alert: "Une erreur s'est passée lors de la modification. Vous n'avez renseigné la date d'effet."}
        end

        return
      end

    end

  
    respond_to do |format|
      if @bank.update(bank_params)

       

        @banks = Bank.all
        #compute_commission(@bank.id)
				#handle_commission(@bank.id)
        #handle_commissions
        #new_handle_commissions
        new_calculate_commissions({key: "bank", value: @bank.id })

        format.html { redirect_to @bank, notice: 'Bank was successfully updated.' }
        format.json { render :show, status: :ok, location: @bank }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @bank.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @bank = Bank.find(params[:bank_id])
  end
  # DELETE /banks/1
  # DELETE /banks/1.json
  def destroy
    @banks = Bank.all
    @bank.destroy
    

    respond_to do |format|
      format.html { redirect_to banks_url, notice: 'Bank was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank
      @bank = Bank.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bank_params
      params.require(:bank).permit(:name, :description, :commission_percentage, :hypoplus_commission_percentage, :first_installment, :number_of_dates, :number_of_remaining_days, :company_remaining_commission_rate)
    end


  




    

      
end

