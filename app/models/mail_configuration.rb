class MailConfiguration < ApplicationRecord
  belongs_to :user

  # Validations.

  validates_presnce_of :user_name, :password, :domain, :address, :port, :authentication

end
