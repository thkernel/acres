class UserCommissionEditionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_commission_edition, only: [:show, :edit, :update, :destroy]
  layout "dashboard"
  # GET /user_commission_editions
  # GET /user_commission_editions.json
  def index
    @user_commission_editions = UserCommissionEdition.all
  end

  # GET /user_commission_editions/1
  # GET /user_commission_editions/1.json
  def show
  end

  # GET /user_commission_editions/new
  def new
    @user_commission_edition = UserCommissionEdition.new
  end

  # GET /user_commission_editions/1/edit
  def edit
  end

  # POST /user_commission_editions
  # POST /user_commission_editions.json
  def create
    @user_commission_edition = UserCommissionEdition.new(user_commission_edition_params)

    respond_to do |format|
      if @user_commission_edition.save
        format.html { redirect_to @user_commission_edition, notice: 'User commission edition was successfully created.' }
        format.json { render :show, status: :created, location: @user_commission_edition }
      else
        format.html { render :new }
        format.json { render json: @user_commission_edition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_commission_editions/1
  # PATCH/PUT /user_commission_editions/1.json
  def update
    respond_to do |format|
      if @user_commission_edition.update(user_commission_edition_params)
        format.html { redirect_to @user_commission_edition, notice: 'User commission edition was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_commission_edition }
      else
        format.html { render :edit }
        format.json { render json: @user_commission_edition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_commission_editions/1
  # DELETE /user_commission_editions/1.json
  def destroy
    @user_commission_edition.destroy
    respond_to do |format|
      format.html { redirect_to user_commission_editions_url, notice: 'User commission edition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_commission_edition
      @user_commission_edition = UserCommissionEdition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_commission_edition_params
      params.require(:user_commission_edition).permit(:date_effet, :completed)
    end
end
