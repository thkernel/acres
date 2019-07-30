class ExcerciseYearsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_excercise_year, only: [:show, :edit, :update, :destroy]
  layout "dashboard", only: [:index, :show, :edit, :update, :destroy]

  # GET /excercise_years
  # GET /excercise_years.json
  def index
    @excercise_years = ExcerciseYear.all
  end

  # GET /excercise_years/1
  # GET /excercise_years/1.json
  def show
  end

  def change_current_excercise
    puts "HELLO"
    redirect_to dashboard_path
  end

  # GET /excercise_years/new
  def new
    @excercise_year = ExcerciseYear.new
  end

  # GET /excercise_years/1/edit
  def edit
  end

  # POST /excercise_years
  # POST /excercise_years.json
  def create
    @excercise_year = current_user.excercise_years.build(excercise_year_params)

    respond_to do |format|
      if @excercise_year.save
        @excercise_years = ExcerciseYear.all
        format.html { redirect_to  excercise_years_path, notice: 'Excercise year was successfully created.' }
        format.json { render :show, status: :created, location: @excercise_year }
        format.js
      else
        format.html { render :new }
        format.json { render json: @excercise_year.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

 
  def update
    respond_to do |format|
      if @excercise_year.update(excercise_year_params)
        @excercise_years = ExcerciseYear.all
        format.html { redirect_to excercise_years_path, notice: 'Excercise year was successfully updated.' }
        format.json { render :show, status: :ok, location: @excercise_year }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @excercise_year.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @excercise_year = ExcerciseYear.find(params[:excercise_year_id])
  end

  # DELETE /excercise_years/1.json
  def destroy
    @excercise_year.destroy
    respond_to do |format|
      format.html { redirect_to excercise_years_url, notice: 'Excercise year was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_excercise_year
      @excercise_year = ExcerciseYear.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def excercise_year_params
      params.require(:excercise_year).permit(:name, :start_date, :end_date, :status)
    end
end
