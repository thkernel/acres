# Include calculate commission module
include CalculateBankCommissionRateEvolution
include CheckFirstInstallmentPaymentDelayExpired
include SharedUtils::ExcerciseYearMixin
include SharedUtils::CronLogger

namespace :tasks do
    

    desc "Calculate bank commission rate evolution"
    task calculate_bank_commission_rate_evolution: :environment do 
        # Get all tenants
        tenants = Apartment.tenant_names
        puts "Tenants: #{tenants}" 

        tenants.each do |tenant|
            Apartment::Tenant.switch(tenant) do
                # Get all enable record in bank_commission_rate_tracker table.
                if openned_excercise
                    enable_bank_commission_rate_changments =  BankCommissionRateTracker.where(["status = ? AND excercise_year_id = ?",  "enable", openned_excercise.id] )
               
                    calculate_bank_commission_rate_evolution(enable_bank_commission_rate_changments)
                end
            end
        end

        cron_logger.info("======== CRON: CALCULATE BANK COMMISSION RATE EVOLUTION, AT: #{Time.now} ===========")

        
    end

    desc "Check first installment payment delay expired"
    task check_first_installment_payment_delay_expired: :environment do
        
        tenants = Apartment.tenant_names
        puts "Tenants: #{tenants}" 

        tenants.each do |tenant|
            Apartment::Tenant.switch(tenant) do
                if openned_excercise
                    #puts "Yes, #{openned_excercise.id}"
                    puts "CURRENT TENANT: #{tenant}"
                    check_first_installment_payment_delay_expired(openned_excercise.id)
                else
                    # Next Tenant
                    next
                end

            end
        end 
        

        cron_logger.info("======== CRON: CHECK FIRST INSTALLMENT PAYMENT DELAY EXPIRED, AT: #{Time.now} ===========")
    end
end
