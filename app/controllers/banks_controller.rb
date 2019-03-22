class BanksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bank, only: [:show, :edit, :update, :destroy]
  layout "dashboard"




  # GET /banks
  # GET /banks.json
  def index
   
      @banks = Bank.all
    
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
    respond_to do |format|
      if @bank.update(bank_params)
        puts "HUMMMMMMMMMMMMMMMMMMMMMMMMMMMM CHANGED: #{params[:commission_percentageeee]}"

        bank_commission_edition = BankCommissionEdition.new
        bank_commission_edition.date_effet = params[:date_effet]
        bank_commission_edition.new_value = @bank.commission_percentage
        bank_commission_edition.bank_id = @bank.id
        bank_commission_edition.user_id = current_user.id
        bank_commission_edition.save

        @banks = Bank.all
        #compute_commission(@bank.id)
				#handle_commission(@bank.id)
				handle_commissions

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
      params.require(:bank).permit(:name, :description, :commission_percentage, :hypoplus_commission_percentage, :first_installment, :number_of_dates, :number_of_remaining_days)
    end


  




    

      
end

