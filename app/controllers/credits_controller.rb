class CreditsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_credit, only: [:show, :edit, :update, :destroy]
  layout "dashboard"

  # GET /credits
  # GET /credits.json
  def index
    #@credits = current_user.credits
    @credits = Credit.where(excercise_year_id: current_excercise.id)
  end

  # GET /credits/1
  # GET /credits/1.json
  def show
  end

  # GET /credits/new
  def new
    @credit = Credit.new
  end

  # GET /credits/1/edit
  def edit
  end

  # POST /credits
  # POST /credits.json
  def create
    @credit = current_user.credits.build(credit_params)

    respond_to do |format|
      if @credit.save
        #@credits = current_user.credits
        @credits = Credit.all

        format.html { redirect_to @credit, notice: 'Credit was successfully created.' }
        format.json { render :show, status: :created, location: @credit }
        format.js
      else
        format.html { render :new }
        format.json { render json: @credit.errors, status: :unprocessable_entity }
        format.js

      end
    end
  end

  # PATCH/PUT /credits/1
  # PATCH/PUT /credits/1.json
  def update
    respond_to do |format|
      if @credit.update(credit_params)
        #@credits = current_user.credits
        @credits = Credit.all

        format.html { redirect_to @credit, notice: 'Credit was successfully updated.' }
        format.json { render :show, status: :ok, location: @credit }
        format.js

      else
        format.html { render :edit }
        format.json { render json: @credit.errors, status: :unprocessable_entity }
        format.js

      end
    end
  end

  def delete 
    @credit = Credit.find(params[:id])
  end

  # DELETE /credits/1
  # DELETE /credits/1.json
  def destroy
    @credit.destroy
    #@credits = current_user.credits
    @credits = Credit.all

    respond_to do |format|
      format.html { redirect_to credits_url, notice: 'Credit was successfully destroyed.' }
      format.json { head :no_content }
      format.js

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit
      @credit = Credit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_params
      params.require(:credit).permit(:production_date, :acte_date, :customer_id, :bank_id, :amount)
    end
end
