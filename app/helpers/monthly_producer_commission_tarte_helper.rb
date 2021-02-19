module MonthlyProducerCommissionTarteHelper
    # Handle monthly tarte
    def monthly_producer_commission_tarte(date_debut, date_fin, banks, producer_name, contributor_name, notary, search_term)
        @janvier, @fevrier, @mars, @avril, @mai, @juin, @juillet, @aout, @septembre, @octobre, @novembre, @decembre = false
        @monthly_producer_commission = []
        
        # Bank commission amount.
        @janvier_producer_commission_amount = 0.0 
        @fevrier_producer_commission_amount = 0.0
        @mars_producer_commission_amount = 0.0
        @avril_producer_commission_amount = 0.0 
        @mai_producer_commission_amount = 0.0
        @juin_producer_commission_amount = 0.0
        @juillet_producer_commission_amount = 0.0
        @aout_producer_commission_amount = 0.0
        @septembre_producer_commission_amount = 0.0
        @octobre_producer_commission_amount = 0.0
        @novembre_producer_commission_amount = 0.0
        @decembre_producer_commission_amount = 0.0


    

        
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
                monthly_producer_commission_tarte = MonthlyProducerCommissionTarte.new
                monthly_producer_commission_tarte.bank_name = item.name

                if start_month.present? && end_month.present?
                    (start_month..end_month).each do |month|
                        
                        if search_term == "Par date de production"
                            monthly_producer_commission = Commission.where('extract(month  from production_date) = ? AND extract(year from production_date) = ? AND bank_name = ? AND excercise_year_id =?', month, year, item.name, current_excercise.id) #if production_date_debut.present?
                        elsif search_term == "Par date d'acte"

                            monthly_producer_commission = Commission.where('extract(month  from acte_date) = ? AND extract(year from acte_date) = ? AND bank_name = ? AND excercise_year_id =?', month, year, item.name, current_excercise.id) #if acte_date_debut.present?
                        end
                        
                        monthly_producer_commission = monthly_producer_commission.where('producer_name IN (?)', producer_name) if producer_name.present?
                        monthly_producer_commission = monthly_producer_commission.where('contributor_name IN (?)', contributor_name) if contributor_name.present?
                        monthly_producer_commission = monthly_producer_commission.where('notary_name = ?', notary) if notary.present?

                       
                        current_month = months[month-1]
            
                        #monthly_producer_commission_tarte.months[month+1] = month
                        case current_month
                        when 'janvier'
                            monthly_producer_commission_tarte.janvier_producer_commission_amount = monthly_producer_commission.sum(:producer_commission)
                            @janvier_producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            monthly_producer_commission_tarte.producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            @janvier = true
                        when 'fevrier'
                            monthly_producer_commission_tarte.fevrier_producer_commission_amount = monthly_producer_commission.sum(:producer_commission)
                            @fevrier_producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            monthly_producer_commission_tarte.producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            @fevrier = true
                        when 'mars'
                            monthly_producer_commission_tarte.mars_producer_commission_amount = monthly_producer_commission.sum(:producer_commission)
                            @mars_producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            monthly_producer_commission_tarte.producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            @mars = true
                        when 'avril'
                            monthly_producer_commission_tarte.avril_producer_commission_amount = monthly_producer_commission.sum(:producer_commission)
                            @avril_producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            monthly_producer_commission_tarte.producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            @avril = true
                        when 'mai'
                            monthly_producer_commission_tarte.mai_producer_commission_amount = monthly_producer_commission.sum(:producer_commission)
                            @mai_producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            monthly_producer_commission_tarte.producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            @mai = true
                        when 'juin'
                            monthly_producer_commission_tarte.juin_producer_commission_amount = monthly_producer_commission.sum(:producer_commission)
                            @juin_producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            monthly_producer_commission_tarte.producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            @juin = true
                        when 'juillet'
                            monthly_producer_commission_tarte.juillet_producer_commission_amount = monthly_producer_commission.sum(:producer_commission)
                            @juillet_producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            monthly_producer_commission_tarte.producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            @juillet = true
                        when 'aout'
                            monthly_producer_commission_tarte.aout_producer_commission_amount = monthly_producer_commission.sum(:producer_commission)
                            @aout_producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            monthly_producer_commission_tarte.producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            @aout = true
                        when 'septembre'
                            monthly_producer_commission_tarte.septembre_producer_commission_amount = monthly_producer_commission.sum(:producer_commission)
                            @septembre_producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            monthly_producer_commission_tarte.producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            @septembre = true
                        when 'octobre'

                            monthly_producer_commission_tarte.octobre_producer_commission_amount = monthly_producer_commission.sum(:producer_commission)
                            @octobre_producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            monthly_producer_commission_tarte.producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            @octobre = true
                        when 'novembre'
                            monthly_producer_commission_tarte.novembre_producer_commission_amount = monthly_producer_commission.sum(:producer_commission)
                            @novembre_producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            monthly_producer_commission_tarte.producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            @novembre = true
                        when 'decembre'
                            monthly_producer_commission_tarte.decembre_producer_commission_amount = monthly_producer_commission.sum(:producer_commission)
                            @decembre_producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            monthly_producer_commission_tarte.producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            @decembre = true
                        end
                    end 

                    @monthly_producer_commission << monthly_producer_commission_tarte
            
                else
                    (1..12).each do |month|

                        monthly_producer_commission = Commission.where('extract(month  from acte_date) = ? AND bank_name = ? AND excercise_year_id = ?', month, item.name, current_excercise.id)
                        monthly_producer_commission = monthly_producer_commission.where('extract(month  from production_date) = ? AND bank_name = ? AND excercise_year_id = ?', month, item.name, current_excercise.id)
                        monthly_producer_commission = monthly_producer_commission.where('producer_name IN (?)', producer_name) if producer_name.present?
                        monthly_producer_commission = monthly_producer_commission.where('contributor_name IN (?)', contributor_name) if contributor_name.present?
                        monthly_producer_commission = monthly_producer_commission.where('notary_name = ?', notary) if notary.present?

                        current_month = months[month-1]
            
                        #producer_commission.months[month+1] = month
                        case current_month
                            when 'janvier'
                            monthly_producer_commission_tarte.janvier_producer_commission_amount = monthly_producer_commission.sum(:producer_commission)
                            @janvier_producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            monthly_producer_commission_tarte.producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            @janvier = true
                        when 'fevrier'
                            monthly_producer_commission_tarte.fevrier_producer_commission_amount = monthly_producer_commission.sum(:producer_commission)
                            @fevrier_producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            monthly_producer_commission_tarte.producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            @fevrier = true
                        when 'mars'
                            monthly_producer_commission_tarte.mars_producer_commission_amount = monthly_producer_commission.sum(:producer_commission)
                            @mars_producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            monthly_producer_commission_tarte.producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            @mars = true
                        when 'avril'
                            monthly_producer_commission_tarte.avril_producer_commission_amount = monthly_producer_commission.sum(:producer_commission)
                            @avril_producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            monthly_producer_commission_tarte.producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            @avril = true
                        when 'mai'
                            monthly_producer_commission_tarte.mai_producer_commission_amount = monthly_producer_commission.sum(:producer_commission)
                            @mai_producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            monthly_producer_commission_tarte.producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            @mai = true
                        when 'juin'
                            monthly_producer_commission_tarte.juin_producer_commission_amount = monthly_producer_commission.sum(:producer_commission)
                            @juin_producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            monthly_producer_commission_tarte.producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            @juin = true
                        when 'juillet'
                            monthly_producer_commission_tarte.juillet_producer_commission_amount = monthly_producer_commission.sum(:producer_commission)
                            @juillet_producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            monthly_producer_commission_tarte.producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            @juillet = true
                        when 'aout'
                            monthly_producer_commission_tarte.aout_producer_commission_amount = monthly_producer_commission.sum(:producer_commission)
                            @aout_producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            monthly_producer_commission_tarte.producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            @aout = true
                        when 'septembre'
                            monthly_producer_commission_tarte.septembre_producer_commission_amount = monthly_producer_commission.sum(:producer_commission)
                            @septembre_producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            monthly_producer_commission_tarte.producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            @septembre = true
                        when 'octobre'

                            monthly_producer_commission_tarte.octobre_producer_commission_amount = monthly_producer_commission.sum(:producer_commission)
                            @octobre_producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            monthly_producer_commission_tarte.producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            @octobre = true
                        when 'novembre'
                            monthly_producer_commission_tarte.novembre_producer_commission_amount = monthly_producer_commission.sum(:producer_commission)
                            @novembre_producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            monthly_producer_commission_tarte.producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            @novembre = true
                        when 'decembre'
                            monthly_producer_commission_tarte.decembre_producer_commission_amount = monthly_producer_commission.sum(:producer_commission)
                            @decembre_producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            monthly_producer_commission_tarte.producer_commission_amount += monthly_producer_commission.sum(:producer_commission)
                            @decembre = true
                        end
                    end 
                    @monthly_producer_commission << monthly_producer_commission_tarte

                end
            end

            @monthly_producer_commission
        end
    end  
end

class MonthlyProducerCommissionTarte
    attr_accessor :bank_name
    attr_accessor :janvier, :fevrier, :mars, :avril, :mai, :juin, :juillet, :aout, :septembre, :octobre, :novembre, :decembre,:producer_commission_amount
    attr_accessor :janvier_producer_commission_amount, :fevrier_producer_commission_amount, :mars_producer_commission_amount, :avril_producer_commission_amount,:mai_producer_commission_amount, :juin_producer_commission_amount, :juillet_producer_commission_amount, :aout_producer_commission_amount, :septembre_producer_commission_amount, :octobre_producer_commission_amount, :novembre_producer_commission_amount, :decembre_producer_commission_amount
    
    def initialize
      @producer_commission_amount = 0.0

    end
end