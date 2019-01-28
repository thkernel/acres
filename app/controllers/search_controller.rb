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
    @total_commission_nette_company = @commissions.sum(:company_commission)
    @total_commission_producteur = @commissions.sum( :producer_commission)
    monthly_tarte(acte_date_debut, acte_date_fin, producer_name, contributor_name, notary)
  end

  # Handle monthly tarte
  def monthly_tarte(acte_date_debut, acte_date_fin,producer_name, contributor_name, notary)
    @janvier, @fevrier, @mars, @avril, @mai, @juin, @juillet, @aout, @septembre, @octobre, @novembre, @decembre = false
    @monthly = []
    
    banks = Bank.all

    #Loop all bank.
  
    start_month = acte_date_debut.month if acte_date_debut
    end_month = acte_date_fin.month if acte_date_fin
    puts "Le mois date debut: #{acte_date_debut.month}" if acte_date_debut
    puts "Le mois date fin: #{acte_date_fin.month}" if acte_date_fin
    monthly_amount = []
    months = ['janvier','fevrier', 'mars', 'avril', 'mai', 'juin', 'juillet', 'aout', 'septembre', 'octobre', 'novembre', 'decembre']
   

    banks.each do |item|
      bank_commission = MonthlyTarte.new
      bank_commission.bank_name = item.name

      if start_month && end_month
        (start_month..end_month).each do |month|


          monthly_commission = Commission.where('extract(month  from acte_date) = ? AND bank_name = ?', month, item.name)
          monthly_commission = monthly_commission.where('producer_name IN (?)', producer_name) if producer_name.present?
          monthly_commission = monthly_commission.where('contributor_name IN (?)', contributor_name) if contributor_name.present?
          monthly_commission = monthly_commission.where('notary_name = ?', notary) if notary.present?

          current_month = months[month-1]
         
          #bank_commission.months[month+1] = month
          case current_month
            when 'janvier'
              bank_commission.janvier = monthly_commission.sum(:amount_credit)
              @janvier = true
            when 'fevrier'
              bank_commission.fevrier = monthly_commission.sum(:amount_credit)
              @fevrier = true
            when 'mars'
              bank_commission.mars = monthly_commission.sum(:amount_credit)
              @mars = true
            when 'avril'
              bank_commission.avril = monthly_commission.sum(:amount_credit)
              @avril = true
            when 'mai'
              bank_commission.mai = monthly_commission.sum(:amount_credit)
              @mai = true
            when 'juin'
              bank_commission.juin = monthly_commission.sum(:amount_credit)
              @juin = true
            when 'juillet'
              bank_commission.juillet = monthly_commission.sum(:amount_credit)
              @juillet = true
            when 'aout'
              bank_commission.aout = monthly_commission.sum(:amount_credit)
              @aout = true
            when 'septembre'
              bank_commission.septembre = monthly_commission.sum(:amount_credit)
              @septembre = true
            when 'octobre'

              bank_commission.octobre = monthly_commission.sum(:amount_credit)
              @octobre = true
            when 'novembre'
              bank_commission.novembre = monthly_commission.sum(:amount_credit)
              @novembre = true
            when 'decembre'
              bank_commission.decembre = monthly_commission.sum(:amount_credit)
              @decembre = true
          end
          
            
        end 
        
      end
      comm = Commission.where("acte_date BETWEEN ? AND ? ", acte_date_debut, acte_date_fin)
      comm = Commission.where("bank_name = ? ", item.name)
      bank_commission.amount_credit = comm.sum(:amount_credit)
      bank_commission.bank_commission = comm.sum(:bank_commission)
      bank_commission.contributor_commission = comm.sum(:contributor_commission)
      bank_commission.producer_commission = comm.sum(:producer_commission)
      bank_commission.company_commission = comm.sum(:company_commission)

      @monthly << bank_commission
    
    end
    #puts "Tableau des montant: #{monthly_amount}"
    @monthly
  end

  # Handle monthly tarte - old
  def monthly_tartee
    @monthly = []

    monthly_commissions.each do |item|
    
      #
      start_month = acte_date_debut.month if acte_date_debut
      end_month = acte_date_fin.month if acte_date_fin
      puts "Le mois date debut: #{acte_date_debut.month}" if acte_date_debut
      puts "Le mois date fin: #{acte_date_fin.month}" if acte_date_fin
      monthly_amount = []

      commissions = Commission.all
      if start_month && end_month
        (start_month..end_month).each do |month|
          puts "Hummm super mois: #{month}"
          monthly_commission = commissions.where('extract(month  from acte_date) = ? AND bank_name = ?', month, item.bank_name)
          puts "Commissions du mois: #{month}:  #{commissions}"
          month_amount = monthly_commission.sum(:amount_credit)
          monthly_amount << month_amount
        end 
      end

      #Save in monthly month
      bank_commission = MonthlyTarte.new
      bank_commission.bank_name = item.bank_name
      bank_commission.amount_credit = Commission.search_by_bank(item.bank_name).sum(:amount_credit)
      bank_commission.bank_commission = Commission.search_by_bank(item.bank_name).sum(:bank_commission)

      bank_commission.contributor_commission = Commission.search_by_bank(item.bank_name).sum(:contributor_commission)
      bank_commission.producer_commission = Commission.search_by_bank(item.bank_name).sum(:producer_commission)
      bank_commission.company_commission = Commission.search_by_bank(item.bank_name).sum(:company_commission)
        
      @monthly << bank_commission
    end
    #puts "Tableau des montant: #{monthly_amount}"
  end
   
  

  
end

class MonthlyTarte 
  attr_accessor :bank_name, :janvier, :fevrier, :mars, :avril, :mai, :juin, :juillet, :aout, :septembre, :octobre, :novembre, :decembre,:amount_credit, :contributor_commission, :producer_commission, :company_commission, :bank_commission

  def initializer
  end
end
