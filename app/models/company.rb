class Company < ApplicationRecord
	

	after_create :create_tenant 


	# FriendlyID, to have nice permalink.
	extend FriendlyId
	friendly_id :name, use: :slugged
	
	#belongs_to :user
	#belongs_to :app_config 

	#has_many :organization_users
	#has_many :users, through: :organization_users

    validates_presence_of :name

    # For Paperclip usage
	has_attached_file :brand, styles: { medium: "300x300>", thumb: "200x200>" }, default_url: "/images/brands/:style/missing.png",  validate_media_type: false
	validates_attachment_content_type :brand, content_type: /\Aimage\/.*\z/

    validates_attachment :brand,  :file_dimensions
    
    # Image dimensions validation
	def file_dimensions
		dimensions = Paperclip::Geometry.from_file(file.queued_for_write[:original].path)
		self.width = dimensions.width
		self.height = dimensions.height

		if dimensions.width < 200 && dimensions.height < 200
			errors.add(:file,'Width or height must be at least 50px')
		end
    end
	
	def tenant_name
		self.name
	end

	def create_tenant 
		Apartment::Tenant.create(self.tenant_name) 
	end
end
