include ActionDispatch::TestProcess

FactoryGirl.define do  

  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    address "#{Faker::Address.street_address} #{Faker::Address.city}"
    date_of_birth Faker::Date.backward(10000)
    ssn_last_four '1234'
    phone '555-555-5555'
    emergency_phone '555-555-5555'
    sequence(:email) { |n| "email#{n}@amazon.com" }
    password_digest 'lalalala'
  end
end