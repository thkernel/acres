class User < ApplicationRecord


	#extend FriendlyId
	#friendly_id :name, use: :slugged
	#@user = User.friendly.find(params[:id]) In controller
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable, :trackable, :validatable


	# Fields validations.
	validates :email, uniqueness: true
	validates :role, presence: true
	attr_accessor :current

	# User relationships.
	has_many :logs, dependent: :destroy
	has_one :company, dependent: :destroy
	has_one :mail_configuration, dependent: :destroy
	has_one :commission_setting, dependent: :destroy
	has_one :profile, dependent: :destroy
	has_many  :banks, dependent: :destroy
	has_many :customers, dependent: :destroy
	has_many :credits, dependent: :destroy


	# Find users by roles and authors.
	def self.find_by_role_and_creator(role, user)
		where("role = ? AND created_by = ?", "#{role}", user)
	end

	# Find users by authors.
	def self.find_by_created_by(user)
		where("created_by = ? ", "#{user.id}")
	end



end
