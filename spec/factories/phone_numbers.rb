FactoryGirl.define do
  factory :phone_number do
    phone_type 'Mobile'
    number '555-555-5555'
    
    association :owner
  end
end