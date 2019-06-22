# == Schema Information
#
# Table name: commission_settings
#
#  id                             :bigint           not null, primary key
#  commission_percentage          :float            default(0.0)
#  hypoplus_commission_percentage :float            default(0.0)
#  first_installment              :float            default(0.0)
#  number_of_dates                :integer          default(0)
#  slug                           :string
#  user_id                        :bigint           not null
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#

class CommissionSetting < ApplicationRecord
    # Set the default Status value
	#after_initialize :set_defaults
    belongs_to :user
    has_many :user_commission_editions, dependent: :destroy

    validates_presence_of :commission_percentage
    validates_presence_of :hypoplus_commission_percentage
    #validates_presence_of :first_installment
    #validates_presence_of :number_of_dates

    #def self.unregistered_commission_percentage
        #where('commission_percentage', )
    #end

    #def set_defaults
        #self.commission_percentage ||= 0
        #self.hypoplus_commission_percentage ||= 0
    
    #end
    
end
