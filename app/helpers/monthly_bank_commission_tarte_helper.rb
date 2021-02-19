module MonthlyBankCommissionTarteHelper
    # Handle monthly tarte
    def monthly_bank_commission_tarte(date_debut, date_fin, banks, producer_name, contributor_name, notary, search_term)
        @janvier, @fevrier, @mars, @avril, @mai, @juin, @juillet, @aout, @septembre, @octobre, @novembre, @decembre = false
        @monthly_bank_commission = []
        
        # Bank commission amount.
        @janvier_bank_commission_amount = 0.0 
        @fevrier_bank_commission_amount = 0.0
        @mars_bank_commission_amount = 0.0
        @avril_bank_commission_amount = 0.0 
        @mai_bank_commission_amount = 0.0
        @juin_bank_commission_amount = 0.0
        @juillet_bank_commission_amount = 0.0
        @aout_bank_commission_amount = 0.0
        @septembre_bank_commission_amount = 0.0
        @octobre_bank_commission_amount = 0.0
        @novembre_bank_commission_amount = 0.0
        @decembre_bank_commission_amount = 0.0


    

        
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
                monthly_bank_commission_tarte = MonthlyBankCommissionTarte.new
                monthly_bank_commission_tarte.bank_name = item.name

                if start_month.present? && end_month.present?
                    (start_month..end_month).each do |month|

                        if search_term == "Par date de production"
                            monthly_bank_commission = Commission.where('extract(month  from production_date) = ? AND extract(year from production_date) = ? AND bank_name = ? AND excercise_year_id =?', month, year, item.name, current_excercise.id) #if production_date_debut.present?
                        elsif search_term == "Par date d'acte"
                            monthly_bank_commission = Commission.where('extract(month  from acte_date) = ? AND extract(year from acte_date) = ? AND bank_name = ? AND excercise_year_id =?', month, year, item.name, current_excercise.id) #if acte_date_debut.present?
                        end
                        
                        monthly_bank_commission = monthly_bank_commission.where('producer_name IN (?)', producer_name) if producer_name.present?
                        monthly_bank_commission = monthly_bank_commission.where('contributor_name IN (?)', contributor_name) if contributor_name.present?
                        monthly_bank_commission = monthly_bank_commission.where('notary_name = ?', notary) if notary.present?

                        #AVANT LA BOUCLE DE PARCOUR
                        puts "-------------------------------------------------------------------"
                        #monthly_bank_commission.each do |credit|
                            #puts "*** CREDIT ID: #{credit.credit_identifier}, ACTE_DATE: #{credit.acte_date},  BANK COMMISSION: #{credit.bank_commission}, RECORD AMOUNT: #{credit.bank_commission_amount}"
                        #end

                        puts "--------------------------------------------------------------------"

                        current_month = months[month-1]
            
                        #monthly_bank_commission_tarte.months[month+1] = month
                        case current_month
                        when 'janvier'
                            monthly_bank_commission_tarte.janvier_bank_commission_amount = monthly_bank_commission.sum(:bank_commission)
                            @janvier_bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            monthly_bank_commission_tarte.bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            @janvier = true
                        when 'fevrier'
                            monthly_bank_commission_tarte.fevrier_bank_commission_amount = monthly_bank_commission.sum(:bank_commission)
                            @fevrier_bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            monthly_bank_commission_tarte.bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            @fevrier = true
                        when 'mars'
                            monthly_bank_commission_tarte.mars_bank_commission_amount = monthly_bank_commission.sum(:bank_commission)
                            @mars_bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            monthly_bank_commission_tarte.bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            @mars = true
                        when 'avril'
                            monthly_bank_commission_tarte.avril_bank_commission_amount = monthly_bank_commission.sum(:bank_commission)
                            @avril_bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            monthly_bank_commission_tarte.bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            @avril = true
                        when 'mai'
                            monthly_bank_commission_tarte.mai_bank_commission_amount = monthly_bank_commission.sum(:bank_commission)
                            @mai_bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            monthly_bank_commission_tarte.bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            @mai = true
                        when 'juin'
                            monthly_bank_commission_tarte.juin_bank_commission_amount = monthly_bank_commission.sum(:bank_commission)
                            @juin_bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            monthly_bank_commission_tarte.bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            @juin = true
                        when 'juillet'
                            monthly_bank_commission_tarte.juillet_bank_commission_amount = monthly_bank_commission.sum(:bank_commission)
                            @juillet_bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            monthly_bank_commission_tarte.bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            @juillet = true
                        when 'aout'
                            monthly_bank_commission_tarte.aout_bank_commission_amount = monthly_bank_commission.sum(:bank_commission)
                            @aout_bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            monthly_bank_commission_tarte.bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            @aout = true
                        when 'septembre'
                            monthly_bank_commission_tarte.septembre_bank_commission_amount = monthly_bank_commission.sum(:bank_commission)
                            @septembre_bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            monthly_bank_commission_tarte.bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            @septembre = true
                        when 'octobre'

                            monthly_bank_commission_tarte.octobre_bank_commission_amount = monthly_bank_commission.sum(:bank_commission)
                            @octobre_bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            monthly_bank_commission_tarte.bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            @octobre = true
                        when 'novembre'
                            monthly_bank_commission_tarte.novembre_bank_commission_amount = monthly_bank_commission.sum(:bank_commission)
                            @novembre_bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            monthly_bank_commission_tarte.bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            @novembre = true
                        when 'decembre'
                            monthly_bank_commission_tarte.decembre_bank_commission_amount = monthly_bank_commission.sum(:bank_commission)
                            @decembre_bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            monthly_bank_commission_tarte.bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            @decembre = true
                        end
                    end 

                    @monthly_bank_commission << monthly_bank_commission_tarte
            
                else
                    (1..12).each do |month|

                        monthly_bank_commission = Commission.where('extract(month  from acte_date) = ? AND bank_name = ? AND excercise_year_id = ?', month, item.name, current_excercise.id)
                        monthly_bank_commission = monthly_bank_commission.where('extract(month  from production_date) = ? AND bank_name = ? AND excercise_year_id = ?', month, item.name, current_excercise.id)
                        monthly_bank_commission = monthly_bank_commission.where('producer_name IN (?)', producer_name) if producer_name.present?
                        monthly_bank_commission = monthly_bank_commission.where('contributor_name IN (?)', contributor_name) if contributor_name.present?
                        monthly_bank_commission = monthly_bank_commission.where('notary_name = ?', notary) if notary.present?

                        current_month = months[month-1]
            
                        #bank_commission.months[month+1] = month
                        case current_month
                            when 'janvier'
                            monthly_bank_commission_tarte.janvier_bank_commission_amount = monthly_bank_commission.sum(:bank_commission)
                            @janvier_bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            monthly_bank_commission_tarte.bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            @janvier = true
                        when 'fevrier'
                            monthly_bank_commission_tarte.fevrier_bank_commission_amount = monthly_bank_commission.sum(:bank_commission)
                            @fevrier_bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            monthly_bank_commission_tarte.bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            @fevrier = true
                        when 'mars'
                            monthly_bank_commission_tarte.mars_bank_commission_amount = monthly_bank_commission.sum(:bank_commission)
                            @mars_bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            monthly_bank_commission_tarte.bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            @mars = true
                        when 'avril'
                            monthly_bank_commission_tarte.avril_bank_commission_amount = monthly_bank_commission.sum(:bank_commission)
                            @avril_bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            monthly_bank_commission_tarte.bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            @avril = true
                        when 'mai'
                            monthly_bank_commission_tarte.mai_bank_commission_amount = monthly_bank_commission.sum(:bank_commission)
                            @mai_bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            monthly_bank_commission_tarte.bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            @mai = true
                        when 'juin'
                            monthly_bank_commission_tarte.juin_bank_commission_amount = monthly_bank_commission.sum(:bank_commission)
                            @juin_bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            monthly_bank_commission_tarte.bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            @juin = true
                        when 'juillet'
                            monthly_bank_commission_tarte.juillet_bank_commission_amount = monthly_bank_commission.sum(:bank_commission)
                            @juillet_bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            monthly_bank_commission_tarte.bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            @juillet = true
                        when 'aout'
                            monthly_bank_commission_tarte.aout_bank_commission_amount = monthly_bank_commission.sum(:bank_commission)
                            @aout_bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            monthly_bank_commission_tarte.bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            @aout = true
                        when 'septembre'
                            monthly_bank_commission_tarte.septembre_bank_commission_amount = monthly_bank_commission.sum(:bank_commission)
                            @septembre_bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            monthly_bank_commission_tarte.bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            @septembre = true
                        when 'octobre'

                            monthly_bank_commission_tarte.octobre_bank_commission_amount = monthly_bank_commission.sum(:bank_commission)
                            @octobre_bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            monthly_bank_commission_tarte.bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            @octobre = true
                        when 'novembre'
                            monthly_bank_commission_tarte.novembre_bank_commission_amount = monthly_bank_commission.sum(:bank_commission)
                            @novembre_bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            monthly_bank_commission_tarte.bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            @novembre = true
                        when 'decembre'
                            monthly_bank_commission_tarte.decembre_bank_commission_amount = monthly_bank_commission.sum(:bank_commission)
                            @decembre_bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            monthly_bank_commission_tarte.bank_commission_amount += monthly_bank_commission.sum(:bank_commission)
                            @decembre = true
                        end
                    end 
                    @monthly_bank_commission << monthly_bank_commission_tarte

                end
            end

            @monthly_bank_commission
        end
    end  
end

class MonthlyBankCommissionTarte
    attr_accessor :bank_name
    attr_accessor :janvier, :fevrier, :mars, :avril, :mai, :juin, :juillet, :aout, :septembre, :octobre, :novembre, :decembre,:bank_commission_amount
    attr_accessor :janvier_bank_commission_amount, :fevrier_bank_commission_amount, :mars_bank_commission_amount, :avril_bank_commission_amount,:mai_bank_commission_amount, :juin_bank_commission_amount, :juillet_bank_commission_amount, :aout_bank_commission_amount, :septembre_bank_commission_amount, :octobre_bank_commission_amount, :novembre_bank_commission_amount, :decembre_bank_commission_amount
    
    def initialize
      @bank_commission_amount = 0.0

    end
end