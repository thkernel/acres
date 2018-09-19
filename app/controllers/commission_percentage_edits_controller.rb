class CommissionPercentageEditsController < ApplicationController
  before_action :set_commission_percentage_edit, only: [:show, :edit, :update, :destroy]

  # GET /commission_percentage_edits
  # GET /commission_percentage_edits.json
  def index
    @commission_percentage_edits = CommissionPercentageEdit.all
  end

  # GET /commission_percentage_edits/1
  # GET /commission_percentage_edits/1.json
  def show
  end

  # GET /commission_percentage_edits/new
  def new
    @commission_percentage_edit = CommissionPercentageEdit.new
  end

  # GET /commission_percentage_edits/1/edit
  def edit
  end

  # POST /commission_percentage_edits
  # POST /commission_percentage_edits.json
  def create
    @commission_percentage_edit = CommissionPercentageEdit.new(commission_percentage_edit_params)

    respond_to do |format|
      if @commission_percentage_edit.save
        format.html { redirect_to @commission_percentage_edit, notice: 'Commission percentage edit was successfully created.' }
        format.json { render :show, status: :created, location: @commission_percentage_edit }
      else
        format.html { render :new }
        format.json { render json: @commission_percentage_edit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /commission_percentage_edits/1
  # PATCH/PUT /commission_percentage_edits/1.json
  def update
    respond_to do |format|
      if @commission_percentage_edit.update(commission_percentage_edit_params)
        format.html { redirect_to @commission_percentage_edit, notice: 'Commission percentage edit was successfully updated.' }
        format.json { render :show, status: :ok, location: @commission_percentage_edit }
      else
        format.html { render :edit }
        format.json { render json: @commission_percentage_edit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commission_percentage_edits/1
  # DELETE /commission_percentage_edits/1.json
  def destroy
    @commission_percentage_edit.destroy
    respond_to do |format|
      format.html { redirect_to commission_percentage_edits_url, notice: 'Commission percentage edit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commission_percentage_edit
      @commission_percentage_edit = CommissionPercentageEdit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def commission_percentage_edit_params
      params.require(:commission_percentage_edit).permit(:date_effet)
    end
end
