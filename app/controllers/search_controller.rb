class SearchController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_bank, only: [:show, :edit, :update, :destroy]
  layout "dashboard"


  def index
  
    
    @credits = Credit.all

    @total_montant_credit = Commission.all.sum(:amount_credit)
    @total_commission_apporteur = Commission.all.sum(:contributor_commission)
    @total_commission_nette_company = Commission.all.sum(:producer_commission)
    @total_commission_producteur = Commission.all.sum(:company_commission)

    @banks = Bank.all
    @contributors = User.find_by(role: 'Apporteur')
    @producers = User.find_by(role: 'Producteur')
    @notaries = Notary.all
  end

  def search
   

    @banks = Bank.all
    @contributors = User.find_by_role('Apporteur')
    @producers = User.find_by_role('Producteur')
    @notaries = Notary.all

    bank_name = params[:bank] if params[:bank].present?
    producer_name = params[:producer] if params[:producer].present?
    contributor_name = params[:contributor] if params[:contributor].present?
    
    #puts "Je suis une date avant #{params[:production_date_debut]}"
    
    production_date_debut = Date.parse(params[:production_date_debut]) if params[:production_date_debut].present?
    production_date_fin = Date.parse(params[:production_date_fin]) if params[:production_date_fin].present?

    #puts "Je suis une #{production_date}"
    
    acte_date_debut = Date.parse(params[:acte_date_debut]) if params[:acte_date_debut].present? 
    acte_date_fin = Date.parse(params[:acte_date_fin]) if params[:acte_date_fin].present? 

    
    notary = params[:notary] if params[:notary].present?

    bank_name = bank_name.reject{ |e| e.to_s.empty? } if bank_name.present?
    producer_name = producer_name.reject{ |e| e.to_s.empty? } if producer_name.present?
    contributor_name = contributor_name.reject{ |e| e.to_s.empty? } if contributor_name.present?


    @commissions = Commission.search(production_date_debut,production_date_fin, acte_date_debut, acte_date_fin,   bank_name, producer_name, contributor_name, notary, get_main_admin(current_user))#.paginate(:page => params[:page], :per_page => 15) #if Credit.search(bank_name).present?


    @total_montant_credit = @commissions.sum(:amount_credit)
    @total_commission_apporteur = @commissions.sum(:contributor_commission)
    @total_commission_nette_company = @commissions.sum(:producer_commission)
    @total_commission_producteur = @commissions.sum(:company_commission)


    respond_to do |format|
      format.html { }
     
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
