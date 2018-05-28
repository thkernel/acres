json.extract! mail_configuration, :id, :host, :user_name, :password, :domain, :address, :port, :authentication, :enable_starttls_auto, :boolean, :ssl, :user_id, :created_at, :updated_at
json.url mail_configuration_url(mail_configuration, format: :json)
