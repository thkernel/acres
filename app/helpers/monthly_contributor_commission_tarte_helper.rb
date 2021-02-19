module MonthlyContributorCommissionTarteHelper
    # Handle monthly tarte
    def monthly_contributor_commission_tarte(date_debut, date_fin, banks, producer_name, contributor_name, notary, search_term)
        @janvier, @fevrier, @mars, @avril, @mai, @juin, @juillet, @aout, @septembre, @octobre, @novembre, @decembre = false
        @monthly_contributor_commission = []
        
        # Bank commission amount.
        @janvier_contributor_commission_amount = 0.0 
        @fevrier_contributor_commission_amount = 0.0
        @mars_contributor_commission_amount = 0.0
        @avril_contributor_commission_amount = 0.0 
        @mai_contributor_commission_amount = 0.0
        @juin_contributor_commission_amount = 0.0
        @juillet_contributor_commission_amount = 0.0
        @aout_contributor_commission_amount = 0.0
        @septembre_contributor_commission_amount = 0.0
        @octobre_contributor_commission_amount = 0.0
        @novembre_contributor_commission_amount = 0.0
        @decembre_contributor_commission_amount = 0.0


    

        
        #banks = Bank.all #We filter banks by selected banks.
        banks = banks.present? ? Bank.where("name IN (?)", banks) : Bank.all


        #Loop all bank.
    
        start_month = date_debut.month if date_debut
        end_month = date_fin.month if date_fin

       
        
        
        year = date_fin.year if date_fin
        

        monthly_amount = []
        months = ['janvier','fevrier', 'mars', 'avril', 'mai', 'juin', 'juillet', 'aout', 'septembre', 'octobre', 'novembre', 'decembre']
    
        if banks.present?
            banks.each do |item|
                monthly_contributor_commission_tarte = MonthlyContributorCommissionTarte.new
                monthly_contributor_commission_tarte.bank_name = item.name

                if start_month.present? && end_month.present?
                    (start_month..end_month).each do |month|
                        if search_term == "Par date de production"
                            monthly_contributor_commission = Commission.where('extract(month  from production_date) = ? AND extract(year from production_date) = ? AND bank_name = ? AND excercise_year_id =?', month, year, item.name, current_excercise.id) #if production_date_debut.present?
                        elsif search_term == "Par date d'acte"
                            monthly_contributor_commission = Commission.where('extract(month  from acte_date) = ? AND extract(year from acte_date) = ? AND bank_name = ? AND excercise_year_id =?', month, year, item.name, current_excercise.id) #if acte_date_debut.present?
                        end
                        
                        monthly_contributor_commission = monthly_contributor_commission.where('producer_name IN (?)', producer_name) if producer_name.present?
                        monthly_contributor_commission = monthly_contributor_commission.where('contributor_name IN (?)', contributor_name) if contributor_name.present?
                        monthly_contributor_commission = monthly_contributor_commission.where('notary_name = ?', notary) if notary.present?

                       
                        current_month = months[month-1]
            
                        #monthly_contributor_commission_tarte.months[month+1] = month
                        case current_month
                        when 'janvier'
                            monthly_contributor_commission_tarte.janvier_contributor_commission_amount = monthly_contributor_commission.sum(:contributor_commission)
                            @janvier_contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            monthly_contributor_commission_tarte.contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            @janvier = true
                        when 'fevrier'
                            monthly_contributor_commission_tarte.fevrier_contributor_commission_amount = monthly_contributor_commission.sum(:contributor_commission)
                            @fevrier_contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            monthly_contributor_commission_tarte.contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            @fevrier = true
                        when 'mars'
                            monthly_contributor_commission_tarte.mars_contributor_commission_amount = monthly_contributor_commission.sum(:contributor_commission)
                            @mars_contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            monthly_contributor_commission_tarte.contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            @mars = true
                        when 'avril'
                            monthly_contributor_commission_tarte.avril_contributor_commission_amount = monthly_contributor_commission.sum(:contributor_commission)
                            @avril_contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            monthly_contributor_commission_tarte.contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            @avril = true
                        when 'mai'
                            monthly_contributor_commission_tarte.mai_contributor_commission_amount = monthly_contributor_commission.sum(:contributor_commission)
                            @mai_contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            monthly_contributor_commission_tarte.contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            @mai = true
                        when 'juin'
                            monthly_contributor_commission_tarte.juin_contributor_commission_amount = monthly_contributor_commission.sum(:contributor_commission)
                            @juin_contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            monthly_contributor_commission_tarte.contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            @juin = true
                        when 'juillet'
                            monthly_contributor_commission_tarte.juillet_contributor_commission_amount = monthly_contributor_commission.sum(:contributor_commission)
                            @juillet_contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            monthly_contributor_commission_tarte.contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            @juillet = true
                        when 'aout'
                            monthly_contributor_commission_tarte.aout_contributor_commission_amount = monthly_contributor_commission.sum(:contributor_commission)
                            @aout_contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            monthly_contributor_commission_tarte.contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            @aout = true
                        when 'septembre'
                            monthly_contributor_commission_tarte.septembre_contributor_commission_amount = monthly_contributor_commission.sum(:contributor_commission)
                            @septembre_contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            monthly_contributor_commission_tarte.contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            @septembre = true
                        when 'octobre'

                            monthly_contributor_commission_tarte.octobre_contributor_commission_amount = monthly_contributor_commission.sum(:contributor_commission)
                            @octobre_contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            monthly_contributor_commission_tarte.contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            @octobre = true
                        when 'novembre'
                            monthly_contributor_commission_tarte.novembre_contributor_commission_amount = monthly_contributor_commission.sum(:contributor_commission)
                            @novembre_contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            monthly_contributor_commission_tarte.contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            @novembre = true
                        when 'decembre'
                            monthly_contributor_commission_tarte.decembre_contributor_commission_amount = monthly_contributor_commission.sum(:contributor_commission)
                            @decembre_contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            monthly_contributor_commission_tarte.contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            @decembre = true
                        end
                    end 

                    @monthly_contributor_commission << monthly_contributor_commission_tarte
            
                else
                    (1..12).each do |month|

                        monthly_contributor_commission = Commission.where('extract(month  from acte_date) = ? AND bank_name = ? AND excercise_year_id = ?', month, item.name, current_excercise.id)
                        monthly_contributor_commission = monthly_contributor_commission.where('extract(month  from production_date) = ? AND bank_name = ? AND excercise_year_id = ?', month, item.name, current_excercise.id)
                        monthly_contributor_commission = monthly_contributor_commission.where('producer_name IN (?)', producer_name) if producer_name.present?
                        monthly_contributor_commission = monthly_contributor_commission.where('contributor_name IN (?)', contributor_name) if contributor_name.present?
                        monthly_contributor_commission = monthly_contributor_commission.where('notary_name = ?', notary) if notary.present?

                        current_month = months[month-1]
            
                        #contributor_commission.months[month+1] = month
                        case current_month
                            when 'janvier'
                            monthly_contributor_commission_tarte.janvier_contributor_commission_amount = monthly_contributor_commission.sum(:contributor_commission)
                            @janvier_contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            monthly_contributor_commission_tarte.contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            @janvier = true
                        when 'fevrier'
                            monthly_contributor_commission_tarte.fevrier_contributor_commission_amount = monthly_contributor_commission.sum(:contributor_commission)
                            @fevrier_contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            monthly_contributor_commission_tarte.contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            @fevrier = true
                        when 'mars'
                            monthly_contributor_commission_tarte.mars_contributor_commission_amount = monthly_contributor_commission.sum(:contributor_commission)
                            @mars_contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            monthly_contributor_commission_tarte.contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            @mars = true
                        when 'avril'
                            monthly_contributor_commission_tarte.avril_contributor_commission_amount = monthly_contributor_commission.sum(:contributor_commission)
                            @avril_contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            monthly_contributor_commission_tarte.contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            @avril = true
                        when 'mai'
                            monthly_contributor_commission_tarte.mai_contributor_commission_amount = monthly_contributor_commission.sum(:contributor_commission)
                            @mai_contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            monthly_contributor_commission_tarte.contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            @mai = true
                        when 'juin'
                            monthly_contributor_commission_tarte.juin_contributor_commission_amount = monthly_contributor_commission.sum(:contributor_commission)
                            @juin_contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            monthly_contributor_commission_tarte.contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            @juin = true
                        when 'juillet'
                            monthly_contributor_commission_tarte.juillet_contributor_commission_amount = monthly_contributor_commission.sum(:contributor_commission)
                            @juillet_contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            monthly_contributor_commission_tarte.contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            @juillet = true
                        when 'aout'
                            monthly_contributor_commission_tarte.aout_contributor_commission_amount = monthly_contributor_commission.sum(:contributor_commission)
                            @aout_contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            monthly_contributor_commission_tarte.contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            @aout = true
                        when 'septembre'
                            monthly_contributor_commission_tarte.septembre_contributor_commission_amount = monthly_contributor_commission.sum(:contributor_commission)
                            @septembre_contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            monthly_contributor_commission_tarte.contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            @septembre = true
                        when 'octobre'

                            monthly_contributor_commission_tarte.octobre_contributor_commission_amount = monthly_contributor_commission.sum(:contributor_commission)
                            @octobre_contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            monthly_contributor_commission_tarte.contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            @octobre = true
                        when 'novembre'
                            monthly_contributor_commission_tarte.novembre_contributor_commission_amount = monthly_contributor_commission.sum(:contributor_commission)
                            @novembre_contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            monthly_contributor_commission_tarte.contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            @novembre = true
                        when 'decembre'
                            monthly_contributor_commission_tarte.decembre_contributor_commission_amount = monthly_contributor_commission.sum(:contributor_commission)
                            @decembre_contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            monthly_contributor_commission_tarte.contributor_commission_amount += monthly_contributor_commission.sum(:contributor_commission)
                            @decembre = true
                        end
                    end 
                    @monthly_contributor_commission << monthly_contributor_commission_tarte

                end
            end

            @monthly_contributor_commission
        end
    end  
end

class MonthlyContributorCommissionTarte
    attr_accessor :bank_name
    attr_accessor :janvier, :fevrier, :mars, :avril, :mai, :juin, :juillet, :aout, :septembre, :octobre, :novembre, :decembre,:contributor_commission_amount
    attr_accessor :janvier_contributor_commission_amount, :fevrier_contributor_commission_amount, :mars_contributor_commission_amount, :avril_contributor_commission_amount,:mai_contributor_commission_amount, :juin_contributor_commission_amount, :juillet_contributor_commission_amount, :aout_contributor_commission_amount, :septembre_contributor_commission_amount, :octobre_contributor_commission_amount, :novembre_contributor_commission_amount, :decembre_contributor_commission_amount
    
    def initialize
      @contributor_commission_amount = 0.0

    end
end