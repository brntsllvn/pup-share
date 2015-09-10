ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'spec_helper'
require 'rspec/rails'
require 'pry'
require 'faker'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods # Include Factory Girl syntax to simplify calls to factories
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.include Features::SessionHelpers, type: :feature # helper
  config.include Features::PupHelpers, type: :feature # helper
end

