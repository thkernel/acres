class Notary < ApplicationRecord
	belongs_to :user

	validates_presence_of :full_name

    # Find users by roles and authors.
	def self.is_notary(full_name)
		where("full_name = ?",  full_name)
	end


end
