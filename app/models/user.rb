class User < ApplicationRecord
  # Set the default Status value
	after_initialize :set_defaults
	#extend FriendlyId
  #friendly_id :name, use: :slugged
  #@user = User.friendly.find(params[:id]) In controller
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, uniqueness: true
  validates :role, presence: true
  attr_accessor :current

  has_many :logs, dependent: :destroy
  has_one :company, dependent: :destroy
  has_one :mail_configuration, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_many  :banks, dependent: :destroy
  has_many :customers, dependent: :destroy
  has_many :credits, dependent: :destroy


  def self.find_by_created_by(user)
      where("created_by = ? ", "#{user.id}")

  end

  
  def set_defaults
		self.current ||= "open"
	end
  
  def self.current
    Thread.current[:user]
  end
  def self.current=(user)
    Thread.current[:user] = user
  end

  

end
