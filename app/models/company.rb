class Company < ApplicationRecord
    belongs_to :user
    validates_presence_of :name, :phone

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
