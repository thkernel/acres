class UserCommissionRateTrackersController < ApplicationController
  before_action :set_user_commission_rate_tracker, only: [:show, :edit, :update, :destroy]

  # GET /user_commission_rate_trackers
  # GET /user_commission_rate_trackers.json
  def index
    @user_commission_rate_trackers = UserCommissionRateTracker.all
  end

  # GET /user_commission_rate_trackers/1
  # GET /user_commission_rate_trackers/1.json
  def show
  end

  # GET /user_commission_rate_trackers/new
  def new
    @user_commission_rate_tracker = UserCommissionRateTracker.new
  end

  # GET /user_commission_rate_trackers/1/edit
  def edit
  end

  # POST /user_commission_rate_trackers
  # POST /user_commission_rate_trackers.json
  def create
    @user_commission_rate_tracker = UserCommissionRateTracker.new(user_commission_rate_tracker_params)
    @user_commission_rate_tracker.excercise_year_id = current_excercise.id
    
    respond_to do |format|
      if @user_commission_rate_tracker.save
        format.html { redirect_to @user_commission_rate_tracker, notice: 'User commission rate tracker was successfully created.' }
        format.json { render :show, status: :created, location: @user_commission_rate_tracker }
      else
        format.html { render :new }
        format.json { render json: @user_commission_rate_tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_commission_rate_trackers/1
  # PATCH/PUT /user_commission_rate_trackers/1.json
  def update
    respond_to do |format|
      if @user_commission_rate_tracker.update(user_commission_rate_tracker_params)
        format.html { redirect_to @user_commission_rate_tracker, notice: 'User commission rate tracker was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_commission_rate_tracker }
      else
        format.html { render :edit }
        format.json { render json: @user_commission_rate_tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_commission_rate_trackers/1
  # DELETE /user_commission_rate_trackers/1.json
  def destroy
    @user_commission_rate_tracker.destroy
    respond_to do |format|
      format.html { redirect_to user_commission_rate_trackers_url, notice: 'User commission rate tracker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_commission_rate_tracker
      @user_commission_rate_tracker = UserCommissionRateTracker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_commission_rate_tracker_params
      params.require(:user_commission_rate_tracker).permit(:start_date, :old_rate, :new_rate, :user_id)
    end
end
