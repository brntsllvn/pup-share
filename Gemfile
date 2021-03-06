source 'https://rubygems.org'

gem 'rails', '4.2.0'

gem 'pg'

gem 'bootstrap-sass', '~> 3.3.4'
gem 'coffee-rails', '~> 4.1.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.37'
gem 'momentjs-rails', '>= 2.9.0'

gem 'jquery-rails'
gem 'jquery-ui-rails'

gem 'sass-rails', '>= 3.2'
gem 'simple_form'
gem 'uglifier', '>= 1.3.0'

gem 'jbuilder', '~> 2.0' # Build JSON APIs with ease

gem 'carrierwave-aws' # picture uploading
gem 'mini_magick'

gem 'figaro' # secure env variables

group :development do # debugging
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'faker'
  # gem 'spring' # speeds up app
  gem 'guard-rspec', require: false
end

group :test do
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'capybara-email'
  gem 'codeclimate-test-reporter', require: nil
end

gem 'rails_12factor', group: :production
gem 'airbrake' ### NOT CONFIGURED, subscription product

gem 'sdoc', '~> 0.4.0', group: :doc

gem 'puma' # new server, Heroku/ProductHunt recommended

gem 'daemons'

gem 'date_validator' # allows, uh, validation of dates

gem 'omniauth-linkedin-oauth2' # authentication with Linkedin

gem 'pundit' # authorization from the creators of Capybara

gem 'active_record_union' # until Rails 5

gem "geocoder"

gem 'phony_rails'

gem "paranoia", "~> 2.0" # soft delete

gem 'lupa' # poro orm-independent filtering