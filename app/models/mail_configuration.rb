class MailConfiguration < ApplicationRecord
  belongs_to :user

  # Validations.

  validates_presence_of :user_name, :password, :domain, :address, :port, :authentication

end
