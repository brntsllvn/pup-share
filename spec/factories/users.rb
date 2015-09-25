include ActionDispatch::TestProcess

FactoryGirl.define do  

  factory :user do
    first_name 'Dave'
    last_name 'Wallace'
    sequence(:email) { |i| "#{i}_#{Faker::Internet.email}" } 
    address "#{Faker::Address.street_address} #{Faker::Address.city}"
    date_of_birth Faker::Date.backward(10000)
    ssn_last_four '1234'
    phone '555-555-5555'
    emergency_phone '555-555-5555'
    provider 'linkedin'
    sequence(:uid) { |n| "linkedin_#{n}" }
    image 'dilbert.jpg'
    headline "Miles Davis impersonator and avid reader"

  end
end