require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

require 'capybara/rspec'
require 'capybara/email/rspec'

RSpec.configure do |config|

  config.before(:each) { ActionMailer::Base.deliveries.clear } # uses email_spec gem to clear mail delivereies

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end