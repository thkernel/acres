# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  full_name              :string
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :bigint
#  avatar_updated_at      :datetime
#  role                   :string           not null
#  status                 :string           default("enable"), not null
#  receives_notifications :boolean          default(FALSE)
#  created_by             :bigint
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  receives_summaries     :boolean          default(FALSE)
#  slug                   :string
#  identifier             :string
#

class User < ApplicationRecord


	extend FriendlyId
	friendly_id :full_name, use: :slugged
	
	#@user = User.friendly.find(params[:id]) In controller
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable, :trackable , :validatable


	# Fields validations.
	validates :email, uniqueness: true
	validates :role, presence: true
	validates :full_name, presence: true
	validates :slug,  uniqueness: true
	#validates :login, presence: true
	#validates :password_confirmation, presence: true, on: :create
	#validates_presence_of :password_confirmation, :if => :password
	

	# User relationships.
	has_many :logs, dependent: :destroy
	has_one :company, dependent: :destroy
	has_one :mail_configuration, dependent: :destroy
	has_one :commission_setting, dependent: :destroy
	has_one :profile, dependent: :destroy
	has_one :app_config, dependent: :destroy
	has_many :commissions, dependent: :destroy
	has_many  :banks, dependent: :destroy
	has_many :customers, dependent: :destroy
	has_many :credits, dependent: :destroy
	has_many :notaries, dependent: :destroy
	has_many :accounts, dependent: :destroy
	has_many :excercise_years, dependent: :destroy
	has_many :bank_commission_rate_abandonments, dependent: :destroy

	#has_many :bank_commission_rate_trackers, dependent: :destroy

  has_one :payment_delay, dependent: :destroy


	
	
	# Find users by roles and authors.
	def self.find_by_role_and_creator(role, user)
		where("role = ? AND created_by = ?", "#{role}", user)
	end

	

	def self.find_user_by_name_and_role(name, role)
		where("full_name = ? AND role = ?", "#{name}", role)
	end

	def self.find_by_fullname_and_role(full_name, role)
		where("full_name IN (?) AND role = ?", full_name, role)
	end

	# Find users by roles and authors.
	def self.is_contributor(full_name, role)
		where("full_name = ? AND role = ?",  full_name, role)
	end

	# Find users by roles and authors.
	def self.is_producer(full_name, role)
		where("full_name = ? AND role = ?" ,  full_name, role)
	end

	# Find users by authors.
	def self.find_by_created_by(user)
		where("created_by = ? ", "#{user.id}")
	end

	# Find users by authors.
	def self.find_by_fullname(name)
		where("full_name = ? ", "#{user}")
	end

	# Find user by fulle_name.

    def self.exist?(full_name)
		where("full_name = ? ", "#{user}")
    end

	# Find user by role ("Apporteur or Producteur")
	def self.find_user_by_role(role1, role2)
		where("role = ? OR role = ?", "#{role1}", "#{role2}")
	end
	def self.find_by_role(role)
		where("role = ?", "#{role}")
	end

	def self.find_by_superadmin(role)
		where("role = ?", "#{role}").take
	end

	# For Paperclip usage
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "200x200>" }, default_url: "/images/avatar/:style/missing.png",  validate_media_type: false
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

	validates_attachment :avatar,  :file_dimensions

	# Image dimensions validation
	def file_dimensions
		dimensions = Paperclip::Geometry.from_file(file.queued_for_write[:original].path)
		self.width = dimensions.width
		self.height = dimensions.height

		if dimensions.width < 200 && dimensions.height < 200
			errors.add(:file,'Width or height must be at least 50px')
		end
	end

	private
	def random_user_id 
		begin
			self.slug = "u#{SecureRandom.random_number(1_000_000_000)}"
		end while User.where(slug: self.slug).exists?
	end 
	
end
