class Notary < ApplicationRecord
	belongs_to :user

	validates_presence_of :full_name

    # Find users by roles and authors.
	def self.is_notary(full_name, user_id)
		where("full_name = ? AND user_id = ?",  full_name, user_id)
	end


end
