class BankCommissionRateTrackersController < ApplicationController
  before_action :set_bank_commission_rate_tracker, only: [:show, :edit, :update, :destroy]
  layout "dashboard"
  # GET /bank_commission_rate_trackers
  # GET /bank_commission_rate_trackers.json
  def index
    @bank_commission_rate_trackers = BankCommissionRateTracker.all
  end

  # GET /bank_commission_rate_trackers/1
  # GET /bank_commission_rate_trackers/1.json
  def show
  end

  # GET /bank_commission_rate_trackers/new
  def new
    @bank_commission_rate_tracker = BankCommissionRateTracker.new
  end

  # GET /bank_commission_rate_trackers/1/edit
  def edit
  end

  # POST /bank_commission_rate_trackers
  # POST /bank_commission_rate_trackers.json
  def create
    @bank_commission_rate_tracker = BankCommissionRateTracker.new(bank_commission_rate_tracker_params)
    @bank_commission_rate_tracker.excercise_year_id = current_excercise.id
    
    respond_to do |format|
      if @bank_commission_rate_tracker.save
        format.html { redirect_to @bank_commission_rate_tracker, notice: 'Bank commission rate tracker was successfully created.' }
        format.json { render :show, status: :created, location: @bank_commission_rate_tracker }
      else
        format.html { render :new }
        format.json { render json: @bank_commission_rate_tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bank_commission_rate_trackers/1
  # PATCH/PUT /bank_commission_rate_trackers/1.json
  def update
    respond_to do |format|
      if @bank_commission_rate_tracker.update(bank_commission_rate_tracker_params)
        format.html { redirect_to @bank_commission_rate_tracker, notice: 'Bank commission rate tracker was successfully updated.' }
        format.json { render :show, status: :ok, location: @bank_commission_rate_tracker }
      else
        format.html { render :edit }
        format.json { render json: @bank_commission_rate_tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bank_commission_rate_trackers/1
  # DELETE /bank_commission_rate_trackers/1.json
  def destroy
    @bank_commission_rate_tracker.destroy
    respond_to do |format|
      format.html { redirect_to bank_commission_rate_trackers_url, notice: 'Bank commission rate tracker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_commission_rate_tracker
      @bank_commission_rate_tracker = BankCommissionRateTracker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bank_commission_rate_tracker_params
      params.require(:bank_commission_rate_tracker).permit(:date_effet, :old_rate, :new_rate, :bank_id, :user_id, :status)
    end
end
