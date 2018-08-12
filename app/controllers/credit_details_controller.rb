class CreditDetailsController < ApplicationController
  # This controller is reserved for all user authenticate users
  before_action :authenticate_user!
  
  before_action :set_credit_detail, only: [:show, :edit, :update, :destroy]
  layout "dashboard"

  # GET /credit_details
  # GET /credit_details.json
  def index
    credit_id = params[:id] if params.present?
    @credit = Credit.find_by(credit_id: credit_id)
    @credit_details = @credit.credit_details
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
      else
        format.html { render :new }
        format.json { render json: @credit_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credit_details/1
  # PATCH/PUT /credit_details/1.json
  def update
    respond_to do |format|
      if @credit_detail.update(credit_detail_params)
        format.html { redirect_to @credit_detail, notice: 'Credit detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @credit_detail }
      else
        format.html { render :edit }
        format.json { render json: @credit_detail.errors, status: :unprocessable_entity }
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
