FactoryGirl.define do  

  factory :visitor_message do
    name Faker::Name.name
    sequence(:email) { |n| "email#{n}@amazon.com" }
    type 'Bug Report'
    message 'Click on the widget, click again. There it is.'
  end
end

