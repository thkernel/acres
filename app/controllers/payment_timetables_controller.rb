class PaymentTimetablesController < ApplicationController
  before_action :set_payment_timetable, only: [:show, :edit, :update, :destroy]

  # GET /payment_timetables
  # GET /payment_timetables.json
  def index
    @payment_timetables = PaymentTimetable.all
  end


  
    
  # GET /payment_timetables/1
  # GET /payment_timetables/1.json
  def show
  end

  # GET /payment_timetables/new
  def new
    @payment_timetable = PaymentTimetable.new
  end

  # GET /payment_timetables/1/edit
  def edit
  end

  # POST /payment_timetables
  # POST /payment_timetables.json
  def create
    @payment_timetable = PaymentTimetable.new(payment_timetable_params)

    respond_to do |format|
      if @payment_timetable.save
        format.html { redirect_to @payment_timetable, notice: 'Payment timetable was successfully created.' }
        format.json { render :show, status: :created, location: @payment_timetable }
      else
        format.html { render :new }
        format.json { render json: @payment_timetable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_timetables/1
  # PATCH/PUT /payment_timetables/1.json
  def update
    respond_to do |format|
      if @payment_timetable.update(payment_timetable_params)
        format.html { redirect_to @payment_timetable, notice: 'Payment timetable was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment_timetable }
      else
        format.html { render :edit }
        format.json { render json: @payment_timetable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_timetables/1
  # DELETE /payment_timetables/1.json
  def destroy
    @payment_timetable.destroy
    respond_to do |format|
      format.html { redirect_to payment_timetables_url, notice: 'Payment timetable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_timetable
      @payment_timetable = PaymentTimetable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_timetable_params
      params.require(:payment_timetable).permit(:type, :credit_identifier, :excercise_year_id)
    end
end
