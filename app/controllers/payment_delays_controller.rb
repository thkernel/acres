class PaymentDelaysController < ApplicationController
  before_action :set_payment_delay, only: [:show, :edit, :update, :destroy]
  layout "dashboard"
  # GET /payment_delays
  # GET /payment_delays.json
  def index
    @payment_delays = PaymentDelay.all
  end

  # GET /payment_delays/1
  # GET /payment_delays/1.json
  def show
  end

  def settings
  end

  # GET /payment_delays/new
  def new
    @payment_delay = PaymentDelay.new
  end

  # GET /payment_delays/1/edit
  def edit
  end

  # POST /payment_delays
  # POST /payment_delays.json
  def create
    @payment_delay = current_user.build_payment_delay(payment_delay_params)

    respond_to do |format|
      if @payment_delay.save
        @payment_delay = PaymentDelay.all
        format.html { redirect_to @payment_delay, notice: 'Payment delay was successfully created.' }
        format.json { render :show, status: :created, location: @payment_delay }
        format.js
      else
        format.html { render :new }
        format.json { render json: @payment_delay.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /payment_delays/1
  # PATCH/PUT /payment_delays/1.json
  def update
    respond_to do |format|
      if @payment_delay.update(payment_delay_params)
        format.html { redirect_to @payment_delay, notice: 'Payment delay was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment_delay }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @payment_delay.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /payment_delays/1
  # DELETE /payment_delays/1.json
  def destroy
    @payment_delay.destroy
    respond_to do |format|
      format.html { redirect_to payment_delays_url, notice: 'Payment delay was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_delay
      @payment_delay = PaymentDelay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_delay_params
      params.require(:payment_delay).permit(:first_installment, :monthly_deadlines_before_payment, :monthly_installments)
    end
end
