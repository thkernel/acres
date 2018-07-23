class CommissionSetting < ApplicationRecord
    # Set the default Status value
	#after_initialize :set_defaults
    belongs_to :user

    validates_presence_of :commission_percentage
    validates_presence_of :hypoplus_commission_percentage
    validates_presence_of :first_installment
    validates_presence_of :number_of_dates

    #def self.unregistered_commission_percentage
        #where('commission_percentage', )
    #end

    #def set_defaults
        #self.commission_percentage ||= 0
        #self.hypoplus_commission_percentage ||= 0
    
    #end
    
end
