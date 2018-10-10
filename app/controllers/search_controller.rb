class SearchController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_bank, only: [:show, :edit, :update, :destroy]
  layout "dashboard"


  def index
  

    @credits = Credit.where(user_id: get_main_admin(current_user))
    @banks = Bank.where(user_id: get_main_admin(current_user))
    @contributors = User.find_by_role_and_creator('Apporteur', get_main_admin(current_user))
    @producers = User.find_by_role_and_creator('Producteur', get_main_admin(current_user))
    @notaries = Notary.where(user_id: get_main_admin(current_user))
  end

  def search
    @banks = Bank.where(user_id: get_main_admin(current_user))
    @contributors = User.find_by_role_and_creator('Apporteur', get_main_admin(current_user))
    @producers = User.find_by_role_and_creator('Producteur', get_main_admin(current_user))
    @notaries = Notary.where(user_id: get_main_admin(current_user))

    bank_name = params[:bank] if params[:bank].present?
    producer_name = params[:producer] if params[:producer].present?
    contributor_name = params[:contributor] if params[:contributor].present?
    
    puts "Je suis une date avant #{params[:production_date]}"
    
    production_date = Date.parse(params[:production_date]) if params[:production_date].present?
    
    puts "Je suis une #{production_date}"
    
    acte_date = Date.parse(params[:acte_date]) if params[:acte_date].present? 
    
    notary = params[:notary] if params[:notary].present?

    bank_name = bank_name.reject{ |e| e.to_s.empty? } if bank_name.present?
    producer_name = producer_name.reject{ |e| e.to_s.empty? } if producer_name.present?
    contributor_name = contributor_name.reject{ |e| e.to_s.empty? } if contributor_name.present?


    @commissions = Commission.search(production_date,acte_date,  bank_name, producer_name, contributor_name, notary, get_main_admin(current_user))#.paginate(:page => params[:page], :per_page => 15) #if Credit.search(bank_name).present?

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
