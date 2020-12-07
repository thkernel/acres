module MonthlyCompanyCommissionTarteHelper
    # Handle monthly tarte
    def monthly_company_commission_tarte(acte_date_debut, acte_date_fin,production_date_debut, production_date_fin, banks, producer_name, contributor_name, notary)
        @janvier, @fevrier, @mars, @avril, @mai, @juin, @juillet, @aout, @septembre, @octobre, @novembre, @decembre = false
        @monthly_company_commission = []
        
        # Bank commission amount.
        @janvier_company_commission_amount = 0.0 
        @fevrier_company_commission_amount = 0.0
        @mars_company_commission_amount = 0.0
        @avril_company_commission_amount = 0.0 
        @mai_company_commission_amount = 0.0
        @juin_company_commission_amount = 0.0
        @juillet_company_commission_amount = 0.0
        @aout_company_commission_amount = 0.0
        @septembre_company_commission_amount = 0.0
        @octobre_company_commission_amount = 0.0
        @novembre_company_commission_amount = 0.0
        @decembre_company_commission_amount = 0.0


    

        
        #banks = Bank.all #We filter banks by selected banks.
        banks = banks.present? ? Bank.where("name IN (?)", banks) : Bank.all


        #Loop all bank.
    
        acte_start_month = acte_date_debut.month if acte_date_debut
        acte_end_month = acte_date_fin.month if acte_date_fin

        production_start_month = production_date_debut.month if production_date_debut
        production_end_month = production_date_fin.month if production_date_fin

        puts "Le mois date debut: #{acte_date_debut.month}" if acte_date_debut
        puts "Le mois date fin: #{acte_date_fin.month}" if acte_date_fin
        
        puts "L'année: #{acte_date_fin.year}" if acte_date_fin
        acte_year = acte_date_fin.year if acte_date_fin
        production_year = production_date_fin.year if production_date_fin

        if acte_date_debut.present? && acte_date_fin.present?
            start_month = acte_start_month
            end_month = acte_end_month
        elsif production_date_debut.present? && production_date_fin.present?
            start_month = production_start_month
            end_month = production_end_month
        end

        monthly_amount = []
        months = ['janvier','fevrier', 'mars', 'avril', 'mai', 'juin', 'juillet', 'aout', 'septembre', 'octobre', 'novembre', 'decembre']
    
        if banks.present?
            banks.each do |item|
                monthly_company_commission_tarte = MonthlyCompanyCommissionTarte.new
                monthly_company_commission_tarte.bank_name = item.name

                if start_month.present? && end_month.present?
                    (start_month..end_month).each do |month|
                        monthly_company_commission = Commission.where('extract(month  from production_date) = ? AND extract(year from production_date) = ? AND bank_name = ? AND excercise_year_id =?', month, production_year, item.name, current_excercise.id) if production_date_debut.present?
                        monthly_company_commission = monthly_company_commission.where('extract(month  from acte_date) = ? AND extract(year from acte_date) = ? AND bank_name = ? AND excercise_year_id =?', month, acte_year, item.name, current_excercise.id) if acte_date_debut.present?
                        monthly_company_commission = monthly_company_commission.where('producer_name IN (?)', producer_name) if producer_name.present?
                        monthly_company_commission = monthly_company_commission.where('contributor_name IN (?)', contributor_name) if contributor_name.present?
                        monthly_company_commission = monthly_company_commission.where('notary_name = ?', notary) if notary.present?

                       
                        current_month = months[month-1]
            
                        #monthly_company_commission_tarte.months[month+1] = month
                        case current_month
                        when 'janvier'
                            monthly_company_commission_tarte.janvier_company_commission_amount = monthly_company_commission.sum(:company_commission)
                            @janvier_company_commission_amount += monthly_company_commission.sum(:company_commission)
                            monthly_company_commission_tarte.company_commission_amount += monthly_company_commission.sum(:company_commission)
                            @janvier = true
                        when 'fevrier'
                            monthly_company_commission_tarte.fevrier_company_commission_amount = monthly_company_commission.sum(:company_commission)
                            @fevrier_company_commission_amount += monthly_company_commission.sum(:company_commission)
                            monthly_company_commission_tarte.company_commission_amount += monthly_company_commission.sum(:company_commission)
                            @fevrier = true
                        when 'mars'
                            monthly_company_commission_tarte.mars_company_commission_amount = monthly_company_commission.sum(:company_commission)
                            @mars_company_commission_amount += monthly_company_commission.sum(:company_commission)
                            monthly_company_commission_tarte.company_commission_amount += monthly_company_commission.sum(:company_commission)
                            @mars = true
                        when 'avril'
                            monthly_company_commission_tarte.avril_company_commission_amount = monthly_company_commission.sum(:company_commission)
                            @avril_company_commission_amount += monthly_company_commission.sum(:company_commission)
                            monthly_company_commission_tarte.company_commission_amount += monthly_company_commission.sum(:company_commission)
                            @avril = true
                        when 'mai'
                            monthly_company_commission_tarte.mai_company_commission_amount = monthly_company_commission.sum(:company_commission)
                            @mai_company_commission_amount += monthly_company_commission.sum(:company_commission)
                            monthly_company_commission_tarte.company_commission_amount += monthly_company_commission.sum(:company_commission)
                            @mai = true
                        when 'juin'
                            monthly_company_commission_tarte.juin_company_commission_amount = monthly_company_commission.sum(:company_commission)
                            @juin_company_commission_amount += monthly_company_commission.sum(:company_commission)
                            monthly_company_commission_tarte.company_commission_amount += monthly_company_commission.sum(:company_commission)
                            @juin = true
                        when 'juillet'
                            monthly_company_commission_tarte.juillet_company_commission_amount = monthly_company_commission.sum(:company_commission)
                            @juillet_company_commission_amount += monthly_company_commission.sum(:company_commission)
                            monthly_company_commission_tarte.company_commission_amount += monthly_company_commission.sum(:company_commission)
                            @juillet = true
                        when 'aout'
                            monthly_company_commission_tarte.aout_company_commission_amount = monthly_company_commission.sum(:company_commission)
                            @aout_company_commission_amount += monthly_company_commission.sum(:company_commission)
                            monthly_company_commission_tarte.company_commission_amount += monthly_company_commission.sum(:company_commission)
                            @aout = true
                        when 'septembre'
                            monthly_company_commission_tarte.septembre_company_commission_amount = monthly_company_commission.sum(:company_commission)
                            @septembre_company_commission_amount += monthly_company_commission.sum(:company_commission)
                            monthly_company_commission_tarte.company_commission_amount += monthly_company_commission.sum(:company_commission)
                            @septembre = true
                        when 'octobre'

                            monthly_company_commission_tarte.octobre_company_commission_amount = monthly_company_commission.sum(:company_commission)
                            @octobre_company_commission_amount += monthly_company_commission.sum(:company_commission)
                            monthly_company_commission_tarte.company_commission_amount += monthly_company_commission.sum(:company_commission)
                            @octobre = true
                        when 'novembre'
                            monthly_company_commission_tarte.novembre_company_commission_amount = monthly_company_commission.sum(:company_commission)
                            @novembre_company_commission_amount += monthly_company_commission.sum(:company_commission)
                            monthly_company_commission_tarte.company_commission_amount += monthly_company_commission.sum(:company_commission)
                            @novembre = true
                        when 'decembre'
                            monthly_company_commission_tarte.decembre_company_commission_amount = monthly_company_commission.sum(:company_commission)
                            @decembre_company_commission_amount += monthly_company_commission.sum(:company_commission)
                            monthly_company_commission_tarte.company_commission_amount += monthly_company_commission.sum(:company_commission)
                            @decembre = true
                        end
                    end 

                    @monthly_company_commission << monthly_company_commission_tarte
            
                else
                    (1..12).each do |month|

                        monthly_company_commission = Commission.where('extract(month  from acte_date) = ? AND bank_name = ? AND excercise_year_id = ?', month, item.name, current_excercise.id)
                        monthly_company_commission = monthly_company_commission.where('extract(month  from production_date) = ? AND bank_name = ? AND excercise_year_id = ?', month, item.name, current_excercise.id)
                        monthly_company_commission = monthly_company_commission.where('producer_name IN (?)', producer_name) if producer_name.present?
                        monthly_company_commission = monthly_company_commission.where('contributor_name IN (?)', contributor_name) if contributor_name.present?
                        monthly_company_commission = monthly_company_commission.where('notary_name = ?', notary) if notary.present?

                        current_month = months[month-1]
            
                        #company_commission.months[month+1] = month
                        case current_month
                            when 'janvier'
                            monthly_company_commission_tarte.janvier_company_commission_amount = monthly_company_commission.sum(:company_commission)
                            @janvier_company_commission_amount += monthly_company_commission.sum(:company_commission)
                            monthly_company_commission_tarte.company_commission_amount += monthly_company_commission.sum(:company_commission)
                            @janvier = true
                        when 'fevrier'
                            monthly_company_commission_tarte.fevrier_company_commission_amount = monthly_company_commission.sum(:company_commission)
                            @fevrier_company_commission_amount += monthly_company_commission.sum(:company_commission)
                            monthly_company_commission_tarte.company_commission_amount += monthly_company_commission.sum(:company_commission)
                            @fevrier = true
                        when 'mars'
                            monthly_company_commission_tarte.mars_company_commission_amount = monthly_company_commission.sum(:company_commission)
                            @mars_company_commission_amount += monthly_company_commission.sum(:company_commission)
                            monthly_company_commission_tarte.company_commission_amount += monthly_company_commission.sum(:company_commission)
                            @mars = true
                        when 'avril'
                            monthly_company_commission_tarte.avril_company_commission_amount = monthly_company_commission.sum(:company_commission)
                            @avril_company_commission_amount += monthly_company_commission.sum(:company_commission)
                            monthly_company_commission_tarte.company_commission_amount += monthly_company_commission.sum(:company_commission)
                            @avril = true
                        when 'mai'
                            monthly_company_commission_tarte.mai_company_commission_amount = monthly_company_commission.sum(:company_commission)
                            @mai_company_commission_amount += monthly_company_commission.sum(:company_commission)
                            monthly_company_commission_tarte.company_commission_amount += monthly_company_commission.sum(:company_commission)
                            @mai = true
                        when 'juin'
                            monthly_company_commission_tarte.juin_company_commission_amount = monthly_company_commission.sum(:company_commission)
                            @juin_company_commission_amount += monthly_company_commission.sum(:company_commission)
                            monthly_company_commission_tarte.company_commission_amount += monthly_company_commission.sum(:company_commission)
                            @juin = true
                        when 'juillet'
                            monthly_company_commission_tarte.juillet_company_commission_amount = monthly_company_commission.sum(:company_commission)
                            @juillet_company_commission_amount += monthly_company_commission.sum(:company_commission)
                            monthly_company_commission_tarte.company_commission_amount += monthly_company_commission.sum(:company_commission)
                            @juillet = true
                        when 'aout'
                            monthly_company_commission_tarte.aout_company_commission_amount = monthly_company_commission.sum(:company_commission)
                            @aout_company_commission_amount += monthly_company_commission.sum(:company_commission)
                            monthly_company_commission_tarte.company_commission_amount += monthly_company_commission.sum(:company_commission)
                            @aout = true
                        when 'septembre'
                            monthly_company_commission_tarte.septembre_company_commission_amount = monthly_company_commission.sum(:company_commission)
                            @septembre_company_commission_amount += monthly_company_commission.sum(:company_commission)
                            monthly_company_commission_tarte.company_commission_amount += monthly_company_commission.sum(:company_commission)
                            @septembre = true
                        when 'octobre'

                            monthly_company_commission_tarte.octobre_company_commission_amount = monthly_company_commission.sum(:company_commission)
                            @octobre_company_commission_amount += monthly_company_commission.sum(:company_commission)
                            monthly_company_commission_tarte.company_commission_amount += monthly_company_commission.sum(:company_commission)
                            @octobre = true
                        when 'novembre'
                            monthly_company_commission_tarte.novembre_company_commission_amount = monthly_company_commission.sum(:company_commission)
                            @novembre_company_commission_amount += monthly_company_commission.sum(:company_commission)
                            monthly_company_commission_tarte.company_commission_amount += monthly_company_commission.sum(:company_commission)
                            @novembre = true
                        when 'decembre'
                            monthly_company_commission_tarte.decembre_company_commission_amount = monthly_company_commission.sum(:company_commission)
                            @decembre_company_commission_amount += monthly_company_commission.sum(:company_commission)
                            monthly_company_commission_tarte.company_commission_amount += monthly_company_commission.sum(:company_commission)
                            @decembre = true
                        end
                    end 
                    @monthly_company_commission << monthly_company_commission_tarte

                end
            end

            @monthly_company_commission
        end
    end  
end

class MonthlyCompanyCommissionTarte
    attr_accessor :bank_name
    attr_accessor :janvier, :fevrier, :mars, :avril, :mai, :juin, :juillet, :aout, :septembre, :octobre, :novembre, :decembre,:company_commission_amount
    attr_accessor :janvier_company_commission_amount, :fevrier_company_commission_amount, :mars_company_commission_amount, :avril_company_commission_amount,:mai_company_commission_amount, :juin_company_commission_amount, :juillet_company_commission_amount, :aout_company_commission_amount, :septembre_company_commission_amount, :octobre_company_commission_amount, :novembre_company_commission_amount, :decembre_company_commission_amount
    
    def initialize
      @company_commission_amount = 0.0

    end
end