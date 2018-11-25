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
