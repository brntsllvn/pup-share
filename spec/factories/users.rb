include ActionDispatch::TestProcess

FactoryGirl.define do  

  factory :user do
    address "#{Faker::Address.street_address} #{Faker::Address.city}"
    date_of_birth Faker::Date.backward(10000)
    ssn_last_four '1234'
    phone '555-555-5555'
    emergency_phone '555-555-5555'
  end
end