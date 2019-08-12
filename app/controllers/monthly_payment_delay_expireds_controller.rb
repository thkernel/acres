class MonthlyPaymentDelayExpiredsController < ApplicationController
  before_action :set_monthly_payment_delay_expired, only: [:show, :edit, :update, :destroy]

  # GET /monthly_payment_delay_expireds
  # GET /monthly_payment_delay_expireds.json
  def index
    @monthly_payment_delay_expireds = MonthlyPaymentDelayExpired.all
  end

  # GET /monthly_payment_delay_expireds/1
  # GET /monthly_payment_delay_expireds/1.json
  def show
  end

  # GET /monthly_payment_delay_expireds/new
  def new
    @monthly_payment_delay_expired = MonthlyPaymentDelayExpired.new
  end

  # GET /monthly_payment_delay_expireds/1/edit
  def edit
  end

  # POST /monthly_payment_delay_expireds
  # POST /monthly_payment_delay_expireds.json
  def create
    @monthly_payment_delay_expired = MonthlyPaymentDelayExpired.new(monthly_payment_delay_expired_params)

    respond_to do |format|
      if @monthly_payment_delay_expired.save
        format.html { redirect_to @monthly_payment_delay_expired, notice: 'Monthly payment delay expired was successfully created.' }
        format.json { render :show, status: :created, location: @monthly_payment_delay_expired }
      else
        format.html { render :new }
        format.json { render json: @monthly_payment_delay_expired.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monthly_payment_delay_expireds/1
  # PATCH/PUT /monthly_payment_delay_expireds/1.json
  def update
    respond_to do |format|
      if @monthly_payment_delay_expired.update(monthly_payment_delay_expired_params)
        format.html { redirect_to @monthly_payment_delay_expired, notice: 'Monthly payment delay expired was successfully updated.' }
        format.json { render :show, status: :ok, location: @monthly_payment_delay_expired }
      else
        format.html { render :edit }
        format.json { render json: @monthly_payment_delay_expired.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monthly_payment_delay_expireds/1
  # DELETE /monthly_payment_delay_expireds/1.json
  def destroy
    @monthly_payment_delay_expired.destroy
    respond_to do |format|
      format.html { redirect_to monthly_payment_delay_expireds_url, notice: 'Monthly payment delay expired was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monthly_payment_delay_expired
      @monthly_payment_delay_expired = MonthlyPaymentDelayExpired.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monthly_payment_delay_expired_params
      params.require(:monthly_payment_delay_expired).permit(:credit_identifier, :expiration_date, :installment_identifier, :commission_amount, :user_id)
    end
end
