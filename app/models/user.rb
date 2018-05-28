class User < ApplicationRecord
	#extend FriendlyId
  #friendly_id :name, use: :slugged
  #@user = User.friendly.find(params[:id]) In controller
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, uniqueness: true

  has_many :logs, dependent: :destroy
  has_one :company, dependent: :destroy
  has_one :mail_configuration, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_many  :banks, dependent: :destroy
  has_many :customers, dependent: :destroy

end
