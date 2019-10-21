class FirstInstallmentPaymentDelayExpiredsController < ApplicationController
  before_action :authenticate_user!
  before_action :current_excercise_year

  before_action :set_first_installment_payment_delay_expired, only: [:show, :edit, :update, :destroy]
  layout "dashboard"
  
  # GET /first_installment_payment_delay_expireds
  # GET /first_installment_payment_delay_expireds.json
  def index
    @first_installment_payment_delay_expireds = FirstInstallmentPaymentDelayExpired.all
  end

  # GET /first_installment_payment_delay_expireds/1
  # GET /first_installment_payment_delay_expireds/1.json
  def show
  end

  # GET /first_installment_payment_delay_expireds/new
  def new
    @first_installment_payment_delay_expired = FirstInstallmentPaymentDelayExpired.new
  end

  # GET /first_installment_payment_delay_expireds/1/edit
  def edit
  end

  # POST /first_installment_payment_delay_expireds
  # POST /first_installment_payment_delay_expireds.json
  def create
    @first_installment_payment_delay_expired = FirstInstallmentPaymentDelayExpired.new(first_installment_payment_delay_expired_params)

    respond_to do |format|
      if @first_installment_payment_delay_expired.save
        format.html { redirect_to @first_installment_payment_delay_expired, notice: 'First installment payment delay expired was successfully created.' }
        format.json { render :show, status: :created, location: @first_installment_payment_delay_expired }
      else
        format.html { render :new }
        format.json { render json: @first_installment_payment_delay_expired.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /first_installment_payment_delay_expireds/1
  # PATCH/PUT /first_installment_payment_delay_expireds/1.json
  def update
    respond_to do |format|
      if @first_installment_payment_delay_expired.update(first_installment_payment_delay_expired_params)
        format.html { redirect_to @first_installment_payment_delay_expired, notice: 'First installment payment delay expired was successfully updated.' }
        format.json { render :show, status: :ok, location: @first_installment_payment_delay_expired }
      else
        format.html { render :edit }
        format.json { render json: @first_installment_payment_delay_expired.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /first_installment_payment_delay_expireds/1
  # DELETE /first_installment_payment_delay_expireds/1.json
  def destroy
    @first_installment_payment_delay_expired.destroy
    respond_to do |format|
      format.html { redirect_to first_installment_payment_delay_expireds_url, notice: 'First installment payment delay expired was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_first_installment_payment_delay_expired
      @first_installment_payment_delay_expired = FirstInstallmentPaymentDelayExpired.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def first_installment_payment_delay_expired_params
      params.require(:first_installment_payment_delay_expired).permit(:credit_identifier, :expiration_date, :installment_identifier, :commission_amount, :user_id)
    end
end
