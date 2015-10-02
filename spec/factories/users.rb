include ActionDispatch::TestProcess

FactoryGirl.define do  

  factory :user do
    first_name 'Dave'
    last_name 'Wallace'
    sequence(:email) { |i| "#{i}_#{Faker::Internet.email}" } 
    phone '555-555-5555'
    emergency_phone '555-555-5555'
    provider 'linkedin'
    sequence(:uid) { |n| "linkedin_#{n}" }
    image 'dilbert.jpg'
    headline 'Avid reader'
  end
end