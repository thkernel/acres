class User < ApplicationRecord
	#extend FriendlyId
  #friendly_id :name, use: :slugged
  #@user = User.friendly.find(params[:id]) In controller
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, uniqueness: true

end
