class CommissionSetting < ApplicationRecord
    belongs_to :user

    validates_presence_of :commission_percentage
    validates_presence_of :hypoplus_commission_percentage
    validates_presence_of :first_installment
    validates_presence_of :number_of_dates

    #def self.unregistered_commission_percentage
        #where('commission_percentage', )
    #end

    
end
