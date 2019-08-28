class BorderausController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"
  before_action :set_borderau, only: [:show, :edit, :update, :destroy]

  # GET /borderaus
  # GET /borderaus.json
  def index
    @borderaus = Borderau.all
  end

  # GET /borderaus/1
  # GET /borderaus/1.json
  def show
  end

  # GET /borderaus/new
  def new
    @borderau = Borderau.new
  end

  # GET /borderaus/1/edit
  def edit
  end

  # POST /borderaus
  # POST /borderaus.json
  def create
    @borderau = Borderau.new(borderau_params)

    respond_to do |format|
      if @borderau.save
        format.html { redirect_to @borderau, notice: 'Borderau was successfully created.' }
        format.json { render :show, status: :created, location: @borderau }
      else
        format.html { render :new }
        format.json { render json: @borderau.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /borderaus/1
  # PATCH/PUT /borderaus/1.json
  def update
    respond_to do |format|
      if @borderau.update(borderau_params)
        format.html { redirect_to @borderau, notice: 'Borderau was successfully updated.' }
        format.json { render :show, status: :ok, location: @borderau }
      else
        format.html { render :edit }
        format.json { render json: @borderau.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /borderaus/1
  # DELETE /borderaus/1.json
  def destroy
    @borderau.destroy
    respond_to do |format|
      format.html { redirect_to borderaus_url, notice: 'Borderau was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_borderau
      @borderau = Borderau.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def borderau_params
      params.require(:borderau).permit(:name, :installment, :file_name, :credit_identifier, :excercise_year_id_id)
    end
end
