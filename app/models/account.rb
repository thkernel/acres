# == Schema Information
#
# Table name: public.accounts
#
#  id         :bigint           not null, primary key
#  company    :string           not null
#  subdomain  :string           not null
#  status     :boolean
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Account < ApplicationRecord

  after_create :create_tenant 
    belongs_to :user

    validates :company, presence: true
    validates :subdomain, format: { with: /\A[\w\-]+\Z/i, message: "Le sous-domaine contient des caractères invalide"},
    exclusion: { in: ['www'], message: 'restricted'}

    

    def tenant_name
      self.subdomain
    end

	def create_tenant 
		Apartment::Tenant.create(self.tenant_name) 
	end

end
