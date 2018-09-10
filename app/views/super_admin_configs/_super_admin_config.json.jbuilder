json.extract! super_admin_config, :id, :login, :email, :created_at, :updated_at
json.url super_admin_config_url(super_admin_config, format: :json)
