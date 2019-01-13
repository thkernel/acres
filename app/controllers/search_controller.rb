class SearchController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_bank, only: [:show, :edit, :update, :destroy]
  layout "dashboard"


  

  def search
   

    @banks = Bank.all
    @contributors = User.find_by_role('Apporteur')
    @producers = User.find_by_role('Producteur')
    @notaries = Notary.all

    
    #puts "Je suis une date avant #{params[:production_date_debut]}"
   

    production_date_debut = Date.parse(params[:production_date_debut]) if params[:production_date_debut].present?
    production_date_fin = Date.parse(params[:production_date_fin]) if params[:production_date_fin].present?

    #puts "Je suis une #{production_date}"
    
    acte_date_debut = Date.parse(params[:acte_date_debut]) if params[:acte_date_debut].present? 
    acte_date_fin = Date.parse(params[:acte_date_fin]) if params[:acte_date_fin].present? 
    bank_name = params[:bank] if params[:bank].present?
    producer_name = params[:producer] if params[:producer].present?
    contributor_name = params[:contributor] if params[:contributor].present?
    notary = params[:notary] if params[:notary].present?

    bank_name = bank_name.reject{ |e| e.to_s.empty? } if bank_name.present?
    producer_name = producer_name.reject{ |e| e.to_s.empty? } if producer_name.present?
    contributor_name = contributor_name.reject{ |e| e.to_s.empty? } if contributor_name.present?

     # Geting the selected elements.
     @selected_production_date_debut = production_date_debut if production_date_debut.present?
     @selected_production_date_fin = production_date_fin if production_date_fin.present?
 
 
     @selected_acte_date_debut = acte_date_debut if acte_date_debut.present?
     @selected_acte_date_fin = acte_date_fin if acte_date_fin.present?
     @selected_notary = notary if notary.present?
 
     banks = Bank.find_by_array_of_names(bank_name) if bank_name.present?
     @selected_banks =  banks unless banks.blank?

     producers = User.find_by_fullname_and_role(producer_name, 'Producteur') if producer_name.present?
     @selected_producers =  producers unless producers.blank?

 
     contributors = User.find_by_fullname_and_role(contributor_name, 'Apporteur') if contributor_name.present?
     @selected_contributors =  contributors unless contributors.blank?

     

    @commissions = Commission.search(production_date_debut,production_date_fin, acte_date_debut, acte_date_fin,   bank_name, producer_name, contributor_name, notary)#.paginate(:page => params[:page], :per_page => 15) #if Credit.search(bank_name).present?

    @commissions_chart_pie = Commission.search(production_date_debut,production_date_fin, acte_date_debut, acte_date_fin,   bank_name, producer_name, contributor_name, notary).unscope(:order).group(:bank_name).sum(:bank_commission)
    @commissions_chart_pie_by_company_commission = Commission.search(production_date_debut,production_date_fin, acte_date_debut, acte_date_fin,   bank_name, producer_name, contributor_name, notary).unscope(:order).group(:bank_name).sum(:company_commission)
    monthly_commissions = Commission.group(:bank_name).select(:bank_name)#.search(production_date_debut,production_date_fin, acte_date_debut, acte_date_fin,   bank_name, producer_name, contributor_name, notary)

    puts "PAR BANQUE: #{@commissions_chart_pie}"
    puts "PAR ACRES: #{@commissions_chart_pie_by_company_commission}"

    puts "PAR ACRES: #{@commissions_chart_pie_by_company_commission}"

    @total_montant_credit = @commissions.sum(:amount_credit)
    @total_commission_apporteur = @commissions.sum(:contributor_commission)
    @total_commission_nette_company = @commissions.sum(:producer_commission)
    @total_commission_producteur = @commissions.sum(:company_commission)




    # Handle monthly tarte
    @monthly = []
    monthly_commissions.each do |item|
      bank_commission = MonthlyTarte.new
      bank_commission.bank_name = item.bank_name
      bank_commission.amount_credit = Commission.search_by_bank(item.bank_name).sum(:amount_credit)
      bank_commission.bank_commission = Commission.search_by_bank(item.bank_name).sum(:bank_commission)

      bank_commission.contributor_commission = Commission.search_by_bank(item.bank_name).sum(:contributor_commission)
      bank_commission.producer_commission = Commission.search_by_bank(item.bank_name).sum(:producer_commission)
      bank_commission.company_commission = Commission.search_by_bank(item.bank_name).sum(:company_commission)
      
      @monthly << bank_commission
    end
   
   
    
    


    puts "Le mois: #{acte_date_debut.month}" if acte_date_debut
    
   
  end

  
  

end

class MonthlyTarte 
  attr_accessor :bank_name, :amount_credit, :contributor_commission, :producer_commission, :company_commission, :bank_commission

  def initializer
  end
end
