json.extract! app_config, :id, :name, :url, :icon, :created_at, :updated_at
json.url app_config_url(app_config, format: :json)
