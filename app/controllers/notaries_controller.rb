class NotariesController < ApplicationController
  before_action :authenticate_user!
  before_action :current_excercise_year

  before_action :set_notary, only: [:show, :edit, :update, :destroy]
  layout "dashboard"

  # GET /notaries
  # GET /notaries.json
  def index
    @notaries = Notary.where(excercise_year_id: current_excercise.id)
  end

  # GET /notaries/1
  # GET /notaries/1.json
  def show
  end

  # GET /notaries/new
  def new
    @notary = Notary.new
  end

  # GET /notaries/1/edit
  def edit
  end

  # POST /notaries
  # POST /notaries.json
  def create
    @notary = Notary.new(notary_params)

    respond_to do |format|
      if @notary.save
        @notaries = current_user.notaries
        format.html { redirect_to @notary, notice: 'Notary was successfully created.' }
        format.json { render :show, status: :created, location: @notary }
        format.js
      else
        format.html { render :new }
        format.json { render json: @notary.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /notaries/1
  # PATCH/PUT /notaries/1.json
  def update
    respond_to do |format|
      if @notary.update(notary_params)
        @notaries = current_user.notaries
        format.html { redirect_to @notary, notice: 'Notary was successfully updated.' }
        format.json { render :show, status: :ok, location: @notary }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @notary.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @notary= Notary.find(params[:notary_id])
  end
  # DELETE /notaries/1
  # DELETE /notaries/1.json
  def destroy
    @notary.destroy
    @notaries = get_main_admin(current_user).notaries
    respond_to do |format|
      format.html { redirect_to notaries_url, notice: 'Notary was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notary
      @notary = Notary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notary_params
      params.require(:notary).permit(:full_name, :address, :phone, :email)
    end
end
