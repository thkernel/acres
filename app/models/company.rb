# == Schema Information
#
# Table name: companies
#
#  id                 :bigint           not null, primary key
#  name               :string
#  address            :string
#  city               :string
#  country            :string
#  phone              :string
#  slug               :string
#  brand_file_name    :string
#  brand_content_type :string
#  brand_file_size    :bigint
#  brand_updated_at   :datetime
#  user_id            :bigint           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Company < ApplicationRecord
	

	# FriendlyID, to have nice permalink.
	extend FriendlyId
	friendly_id :name, use: :slugged
	
	belongs_to :user
	#belongs_to :app_config 

	
    validates_presence_of :name, presence: true

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
	
	
	
end
