# == Schema Information
#
# Table name: notaries
#
#  id         :bigint           not null, primary key
#  full_name  :string
#  address    :string
#  phone      :string
#  email      :string
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Notary < ApplicationRecord
	belongs_to :user
	#belongs_to :excercise_year


	validates_presence_of :full_name

    # Find users by roles and authors.
	def self.is_notary(full_name)
		where("full_name = ? ",  full_name)
	end


end
