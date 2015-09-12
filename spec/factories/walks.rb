FactoryGirl.define do  

  factory :walk do
    begin_time Time.now + 1.hour
    begin_location 'Your desk'
    duration 15
    end_time Time.now + 2.hours
    end_location Faker::Name.first_name

    association :user
    association :pup
  end
end