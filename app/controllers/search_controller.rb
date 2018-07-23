class SearchController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_bank, only: [:show, :edit, :update, :destroy]
  layout "dashboard"


  def index
  
    @credits = Credit.all
  end

  def search
    bank_name = params[:bank] if params[:bank].present?
    production_date = params[:production_date] if params[:production_date].present?
    acte_date = params[:acte_date] if params[:acte_date].present? 
    producer = params[:producer] if params[:producer].present?
    contributor = params[:contributor] if params[:contributor].present?
    notary = params[:notary] if params[:notary].present?

    @credits = Credit.search(bank_name)#.paginate(:page => params[:page], :per_page => 15) #if Credit.search(bank_name).present?

    respond_to do |format|
      format.html { }
      format.json {  }
      format.js
    end
   
  end

end
