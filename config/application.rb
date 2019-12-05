require_relative 'boot'

require 'rails/all'
require 'apartment/elevators/subdomain' # or 'domain', 'first_subdomain', 'host'
require './lib/utils'
require './lib/calculate_commission/calculate_bank_commission_rate_evolution'
require './lib/payments_delay_expired/check_first_installment_payment_delay_expired'
require './lib/payments_delay_expired/check_monthly_installment_payment_delay_expired'
require './lib/payments_delay_expired/generate_bordereau'




# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Acres
  class Application < Rails::Application
    #config.middleware.use Apartment::Elevators::Subdomain
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :fr

    config.assets.paths << Rails.root.join("app", "assets", "fonts")

    #config.autoload_paths += %W(#{config.root}/lib)
    #config.autoload_paths += Dir["#{config.root}/lib"]
    #config.autoload_paths << "#{Rails.root}/lib"
    #config.eager_load_paths << "#{Rails.root}/lib"
    #config.enable_dependency_loading = true
    #config.autoload_paths << Rails.root.join('lib')
    #config.eager_load_paths << Rails.root.join('lib')
  end
end
