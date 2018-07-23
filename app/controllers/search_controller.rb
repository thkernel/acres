class SearchController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_bank, only: [:show, :edit, :update, :destroy]
  layout "dashboard"


  def index
  
    @credits = Credit.all
  end

  def search
    bank_name = params[:bank] if params[:bank].present?
    producer_name = params[:producer] if params[:producer].present?
    contributor_name = params[:contributor] if params[:contributor].present?
    production_date = params[:production_date] if params[:production_date].present?
    acte_date = params[:acte_date] if params[:acte_date].present? 
    notary = params[:notary] if params[:notary].present?

    @commissions= Commission.search(production_date,acte_date,  bank_name, producer_name, contributor_name, notary)#.paginate(:page => params[:page], :per_page => 15) #if Credit.search(bank_name).present?

    respond_to do |format|
      format.html { }
      format.xls
      format.json {  }
      format.js
    end
   
  end

  protected

def set_attachment_name(name)
  escaped = URI.encode(name)
  response.headers['Content-Disposition'] = "attachment; filename*=UTF-8''#{escaped}"
end

end
