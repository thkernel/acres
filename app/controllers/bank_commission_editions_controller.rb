class BankCommissionEditionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bank_commission_edition, only: [:show, :edit, :update, :destroy]
  layout "dashboard"
  # GET /bank_commission_editions
  # GET /bank_commission_editions.json
  def index
    @bank_commission_editions = BankCommissionEdition.all
  end

  # GET /bank_commission_editions/1
  # GET /bank_commission_editions/1.json
  def show
  end

  # GET /bank_commission_editions/new
  def new
    @bank_commission_edition = BankCommissionEdition.new
  end

  # GET /bank_commission_editions/1/edit
  def edit
  end

  # POST /bank_commission_editions
  # POST /bank_commission_editions.json
  def create
    @bank_commission_edition = BankCommissionEdition.new(bank_commission_edition_params)

    respond_to do |format|
      if @bank_commission_edition.save
        format.html { redirect_to @bank_commission_edition, notice: 'Bank commission edition was successfully created.' }
        format.json { render :show, status: :created, location: @bank_commission_edition }
      else
        format.html { render :new }
        format.json { render json: @bank_commission_edition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bank_commission_editions/1
  # PATCH/PUT /bank_commission_editions/1.json
  def update
    respond_to do |format|
      if @bank_commission_edition.update(bank_commission_edition_params)
        format.html { redirect_to @bank_commission_edition, notice: 'Bank commission edition was successfully updated.' }
        format.json { render :show, status: :ok, location: @bank_commission_edition }
      else
        format.html { render :edit }
        format.json { render json: @bank_commission_edition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bank_commission_editions/1
  # DELETE /bank_commission_editions/1.json
  def destroy
    @bank_commission_edition.destroy
    respond_to do |format|
      format.html { redirect_to bank_commission_editions_url, notice: 'Bank commission edition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_commission_edition
      @bank_commission_edition = BankCommissionEdition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bank_commission_edition_params
      params.require(:bank_commission_edition).permit(:date_effet, :completed)
    end
end
