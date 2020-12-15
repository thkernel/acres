module MonthlyCreditTarteHelper
    # Handle monthly tarte
    def monthly_credit_tarte(acte_date_debut, acte_date_fin,production_date_debut, production_date_fin, banks, producer_name, contributor_name, notary)
        @janvier, @fevrier, @mars, @avril, @mai, @juin, @juillet, @aout, @septembre, @octobre, @novembre, @decembre = false
        @monthly_credit = []
        
        # Amount.
        @janvier_amount_credit = 0.0 
        @fevrier_amount_credit = 0.0
        @mars_amount_credit = 0.0
        @avril_amount_credit = 0.0 
        @mai_amount_credit = 0.0
        @juin_amount_credit = 0.0
        @juillet_amount_credit = 0.0
        @aout_amount_credit = 0.0
        @septembre_amount_credit = 0.0
        @octobre_amount_credit = 0.0
        @novembre_amount_credit = 0.0
        @decembre_amount_credit = 0.0


    

        
        #banks = Bank.all #We filter banks by selected banks.
        banks = banks.present? ? Bank.where("name IN (?)", banks) : Bank.all


        #Loop all bank.
    
        acte_start_month = acte_date_debut.month if acte_date_debut
        acte_end_month = acte_date_fin.month if acte_date_fin

        production_start_month = production_date_debut.month if production_date_debut
        production_end_month = production_date_fin.month if production_date_fin

        #puts "Le mois date debut: #{acte_date_debut.month}" if acte_date_debut
        #puts "Le mois date fin: #{acte_date_fin.month}" if acte_date_fin
        
        #puts "L'année: #{acte_date_fin.year}" if acte_date_fin
        acte_year = acte_date_fin.year if acte_date_fin
        production_year = production_date_fin.year if production_date_fin

        if acte_date_debut.present? && acte_date_fin
            acte_date = true
        end
        if production_date_debut.present? && production_date_fin
            production_date = true
        end
        
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
                monthly_credit_tarte = MonthlyCreditTarte.new
                monthly_credit_tarte.bank_name = item.name

                if start_month.present? && end_month.present?
                    (start_month..end_month).each do |month|
                        if production_date && acte_date
                            monthly_credit_production = Commission.where('extract(month  from production_date) = ? AND extract(year from production_date) = ? AND bank_name = ? AND excercise_year_id =?', month, production_year, item.name, current_excercise.id)# if production_date_debut.present?
                       
                            stats_logger.info("1er filtre:  #{monthly_credit_production.count}")
                            monthly_credit_production.each do |d|
                                stats_logger.info("ID: #{d.id} /#{d.production_date} --> #{d.amount_credit}")

                            end
                            stats_logger.info("************************")


                            monthly_credit_acte = Commission.where('extract(month  from acte_date) = ? AND extract(year from acte_date) = ? AND bank_name = ? AND excercise_year_id =?', month, acte_year, item.name, current_excercise.id) #if acte_date_debut.present?
                            stats_logger.info("2eme filtre: #{monthly_credit_acte.count}")
                            monthly_credit_acte.each do |dd|
                                stats_logger.info("ID: #{dd.id} /#{dd.acte_date}--> #{dd.amount_credit}")

                            end
                            stats_logger.info("************************")

                            

                            monthly_credit = monthly_credit_production.or(monthly_credit_acte)
                            stats_logger.info("Merge: #{monthly_credit.count}")
                            monthly_credit.each do |dd|
                                stats_logger.info("ID: #{dd.id} --> #{dd.amount_credit}")

                            end
                            stats_logger.info("************************")

                            

                        
                        else

                        end
                        
                        monthly_credit = monthly_credit.where('producer_name IN (?)', producer_name) if producer_name.present?
                        monthly_credit = monthly_credit.where('contributor_name IN (?)', contributor_name) if contributor_name.present?
                        monthly_credit = monthly_credit.where('notary_name = ?', notary) if notary.present?

                        #AVANT LA BOUCLE DE PARCOUR
                        puts "-------------------------------------------------------------------"
                        monthly_credit.each do |credit|
                            puts "*** CREDIT ID: #{credit.credit_identifier}, ACTE_DATE: #{credit.acte_date},  BANK COMMISSION: #{credit.bank_commission}, RECORD AMOUNT: #{credit.amount_credit}"
                        end

                        puts "--------------------------------------------------------------------"

                        current_month = months[month-1]
            
                        #monthly_credit_tarte.months[month+1] = month
                        case current_month
                        when 'janvier'
                            monthly_credit_tarte.janvier_amount_credit = monthly_credit.sum(:amount_credit)
                            @janvier_amount_credit += monthly_credit.sum(:amount_credit)
                            monthly_credit_tarte.amount_credit += monthly_credit.sum(:amount_credit)
                            @janvier = true
                        when 'fevrier'
                            monthly_credit_tarte.fevrier_amount_credit = monthly_credit.sum(:amount_credit)
                            @fevrier_amount_credit += monthly_credit.sum(:amount_credit)
                            monthly_credit_tarte.amount_credit += monthly_credit.sum(:amount_credit)
                            @fevrier = true
                        when 'mars'
                            monthly_credit_tarte.mars_amount_credit = monthly_credit.sum(:amount_credit)
                            @mars_amount_credit += monthly_credit.sum(:amount_credit)
                            monthly_credit_tarte.amount_credit += monthly_credit.sum(:amount_credit)
                            @mars = true
                        when 'avril'
                            monthly_credit_tarte.avril_amount_credit = monthly_credit.sum(:amount_credit)
                            @avril_amount_credit += monthly_credit.sum(:amount_credit)
                            monthly_credit_tarte.amount_credit += monthly_credit.sum(:amount_credit)
                            @avril = true
                        when 'mai'
                            monthly_credit_tarte.mai_amount_credit = monthly_credit.sum(:amount_credit)
                            @mai_amount_credit += monthly_credit.sum(:amount_credit)
                            monthly_credit_tarte.amount_credit += monthly_credit.sum(:amount_credit)
                            @mai = true
                        when 'juin'
                            monthly_credit_tarte.juin_amount_credit = monthly_credit.sum(:amount_credit)
                            @juin_amount_credit += monthly_credit.sum(:amount_credit)
                            monthly_credit_tarte.amount_credit += monthly_credit.sum(:amount_credit)
                            @juin = true
                        when 'juillet'
                            monthly_credit_tarte.juillet_amount_credit = monthly_credit.sum(:amount_credit)
                            @juillet_amount_credit += monthly_credit.sum(:amount_credit)
                            monthly_credit_tarte.amount_credit += monthly_credit.sum(:amount_credit)
                            @juillet = true
                        when 'aout'
                            monthly_credit_tarte.aout_amount_credit = monthly_credit.sum(:amount_credit)
                            @aout_amount_credit += monthly_credit.sum(:amount_credit)
                            monthly_credit_tarte.amount_credit += monthly_credit.sum(:amount_credit)
                            @aout = true
                        when 'septembre'
                            monthly_credit_tarte.septembre_amount_credit = monthly_credit.sum(:amount_credit)
                            @septembre_amount_credit += monthly_credit.sum(:amount_credit)
                            monthly_credit_tarte.amount_credit += monthly_credit.sum(:amount_credit)
                            @septembre = true
                        when 'octobre'

                            monthly_credit_tarte.octobre_amount_credit = monthly_credit.sum(:amount_credit)
                            @octobre_amount_credit += monthly_credit.sum(:amount_credit)
                            monthly_credit_tarte.amount_credit += monthly_credit.sum(:amount_credit)
                            @octobre = true
                        when 'novembre'
                            monthly_credit_tarte.novembre_amount_credit = monthly_credit.sum(:amount_credit)
                            @novembre_amount_credit += monthly_credit.sum(:amount_credit)
                            monthly_credit_tarte.amount_credit += monthly_credit.sum(:amount_credit)
                            @novembre = true
                        when 'decembre'
                            monthly_credit_tarte.decembre_amount_credit = monthly_credit.sum(:amount_credit)
                            @decembre_amount_credit += monthly_credit.sum(:amount_credit)
                            monthly_credit_tarte.amount_credit += monthly_credit.sum(:amount_credit)
                            @decembre = true
                        end
                    end 

                    @monthly_credit << monthly_credit_tarte
            
                else
                    (1..12).each do |month|

                        monthly_credit = Commission.where('extract(month  from acte_date) = ? AND bank_name = ? AND excercise_year_id = ?', month, item.name, current_excercise.id)
                        monthly_credit = monthly_credit.where('extract(month  from production_date) = ? AND bank_name = ? AND excercise_year_id = ?', month, item.name, current_excercise.id)
                        monthly_credit = monthly_credit.where('producer_name IN (?)', producer_name) if producer_name.present?
                        monthly_credit = monthly_credit.where('contributor_name IN (?)', contributor_name) if contributor_name.present?
                        monthly_credit = monthly_credit.where('notary_name = ?', notary) if notary.present?

                        current_month = months[month-1]
            
                        #bank_commission.months[month+1] = month
                        case current_month
                            when 'janvier'
                            monthly_credit_tarte.janvier_amount_credit = monthly_credit.sum(:amount_credit)
                            @janvier_amount_credit += monthly_credit.sum(:amount_credit)
                            monthly_credit_tarte.amount_credit += monthly_credit.sum(:amount_credit)
                            @janvier = true
                        when 'fevrier'
                            monthly_credit_tarte.fevrier_amount_credit = monthly_credit.sum(:amount_credit)
                            @fevrier_amount_credit += monthly_credit.sum(:amount_credit)
                            monthly_credit_tarte.amount_credit += monthly_credit.sum(:amount_credit)
                            @fevrier = true
                        when 'mars'
                            monthly_credit_tarte.mars_amount_credit = monthly_credit.sum(:amount_credit)
                            @mars_amount_credit += monthly_credit.sum(:amount_credit)
                            monthly_credit_tarte.amount_credit += monthly_credit.sum(:amount_credit)
                            @mars = true
                        when 'avril'
                            monthly_credit_tarte.avril_amount_credit = monthly_credit.sum(:amount_credit)
                            @avril_amount_credit += monthly_credit.sum(:amount_credit)
                            monthly_credit_tarte.amount_credit += monthly_credit.sum(:amount_credit)
                            @avril = true
                        when 'mai'
                            monthly_credit_tarte.mai_amount_credit = monthly_credit.sum(:amount_credit)
                            @mai_amount_credit += monthly_credit.sum(:amount_credit)
                            monthly_credit_tarte.amount_credit += monthly_credit.sum(:amount_credit)
                            @mai = true
                        when 'juin'
                            monthly_credit_tarte.juin_amount_credit = monthly_credit.sum(:amount_credit)
                            @juin_amount_credit += monthly_credit.sum(:amount_credit)
                            monthly_credit_tarte.amount_credit += monthly_credit.sum(:amount_credit)
                            @juin = true
                        when 'juillet'
                            monthly_credit_tarte.juillet_amount_credit = monthly_credit.sum(:amount_credit)
                            @juillet_amount_credit += monthly_credit.sum(:amount_credit)
                            monthly_credit_tarte.amount_credit += monthly_credit.sum(:amount_credit)
                            @juillet = true
                        when 'aout'
                            monthly_credit_tarte.aout_amount_credit = monthly_credit.sum(:amount_credit)
                            @aout_amount_credit += monthly_credit.sum(:amount_credit)
                            monthly_credit_tarte.amount_credit += monthly_credit.sum(:amount_credit)
                            @aout = true
                        when 'septembre'
                            monthly_credit_tarte.septembre_amount_credit = monthly_credit.sum(:amount_credit)
                            @septembre_amount_credit += monthly_credit.sum(:amount_credit)
                            monthly_credit_tarte.amount_credit += monthly_credit.sum(:amount_credit)
                            @septembre = true
                        when 'octobre'

                            monthly_credit_tarte.octobre_amount_credit = monthly_credit.sum(:amount_credit)
                            @octobre_amount_credit += monthly_credit.sum(:amount_credit)
                            monthly_credit_tarte.amount_credit += monthly_credit.sum(:amount_credit)
                            @octobre = true
                        when 'novembre'
                            monthly_credit_tarte.novembre_amount_credit = monthly_credit.sum(:amount_credit)
                            @novembre_amount_credit += monthly_credit.sum(:amount_credit)
                            monthly_credit_tarte.amount_credit += monthly_credit.sum(:amount_credit)
                            @novembre = true
                        when 'decembre'
                            monthly_credit_tarte.decembre_amount_credit = monthly_credit.sum(:amount_credit)
                            @decembre_amount_credit += monthly_credit.sum(:amount_credit)
                            monthly_credit_tarte.amount_credit += monthly_credit.sum(:amount_credit)
                            @decembre = true
                        end
                    end 
                    @monthly_credit << monthly_credit_tarte

                end
            end

            @monthly_credit
        end
    end  
end

class MonthlyCreditTarte
    attr_accessor :bank_name
    attr_accessor :janvier, :fevrier, :mars, :avril, :mai, :juin, :juillet, :aout, :septembre, :octobre, :novembre, :decembre,:amount_credit
    attr_accessor :janvier_amount_credit, :fevrier_amount_credit, :mars_amount_credit, :avril_amount_credit,:mai_amount_credit, :juin_amount_credit, :juillet_amount_credit, :aout_amount_credit, :septembre_amount_credit, :octobre_amount_credit, :novembre_amount_credit, :decembre_amount_credit
    
    def initialize
      @amount_credit = 0.0

    end
end