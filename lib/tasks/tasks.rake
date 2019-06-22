# Include calculate commission module
include CalculateCommission

namespace :tasks do
    desc "Excute complementary seeds"
    task complementary_seed: :environment do 
        Role.create(name: "Co-courtier")

    end


    desc "Calculate bank commission rate evolution"
    task calculate_bank_commission_rate_evolution: :environment do 
        # Get all tenants
        tenants = Apartment.tenant_names
        puts "Tenants: #{tenants}" 

        tenants.each do |tenant|
            Apartment::Tenant.switch(tenant) do
                # Get all enable record in bank_commission_rate_tracker table.
                enable_bank_commission_rate_changments =  BankCommissionRateTracker.where(status: "enable")
               
                calculate_bank_commission_rate_evolution(enable_bank_commission_rate_changments)
            end
        end
        
        

        
       

    end

end
