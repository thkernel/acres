source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.5.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use sqlite3 as the database for Active Record
#gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.11'
#gem 'puma', '~> 4.3', '>= 4.3.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  #gem 'selenium-webdriver'

  # For deploymentt
  gem 'capistrano', '~> 3.10', '>= 3.10.2'

  # For rails requirement
  gem 'capistrano-rails', '~> 1.3', '>= 1.3.1'
  gem 'capistrano-rails-collection', '~> 0.1.0'

  # For rvm
  gem 'capistrano-rvm', '~> 0.1.2'

  # For puma
  gem 'capistrano3-puma', '~> 3.1', '>= 3.1.1'
  #gem 'capistrano3-puma', github: "seuros/capistrano-puma"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

#additional gem
gem 'jquery-rails', '~> 4.3', '>= 4.3.3'
gem 'devise', '~> 4.4', '>= 4.4.3'
gem 'devise-i18n', '~> 1.6', '>= 1.6.2'
gem 'cancancan', '~> 2.2'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.4'
#gem 'font-awesome-sass', '~> 5.0.13'

gem 'pg', '~> 1.0'
#gem 'bootstrap', '~> 4.1', '>= 4.1.1'
gem 'bootstrap-sass', '~> 3.3.7'

gem 'rails-i18n', '~> 5.1', '>= 5.1.1'
gem 'friendly_id', '~> 5.2', '>= 5.2.4'
gem 'dotenv-rails', groups: [:development, :test]
gem 'premailer-rails', '~> 1.10', '>= 1.10.2'
gem 'remotipart', '~> 1.4', '>= 1.4.2'
#gem 'roo', '~> 2.7', '>= 2.7.1'
gem 'creek', '~> 2.2'
gem 'paperclip', '~> 6.0'
gem 'client_side_validations', '~> 11.1', '>= 11.1.2'
gem 'action_mailer_auto_url_options', '~> 1.0', '>= 1.0.2'
gem 'will_paginate-bootstrap', '~> 1.0', '>= 1.0.1'
gem 'chosen-rails', '~> 1.8', '>= 1.8.7'
gem 'rubyzip', '~> 1.2.3'
#gem 'rubyzip', '~> 1.1.0'
#gem 'axlsx', '~> 2.0', '>= 2.0.1'
gem 'axlsx', git: 'https://github.com/randym/axlsx.git', ref: 'c8ac844'
gem 'axlsx_rails', '~> 0.5.2'

gem 'apartment', '~> 2.2'

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem 'annotate', '~> 2.7', '>= 2.7.5'

end
 gem 'ajax-datatables-rails'
 gem 'chartkick', '~> 3.0', '>= 3.0.2'
 gem 'highcharts-rails'
 gem 'whenever', '~> 0.11.0'
 
