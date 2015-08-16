FactoryGirl.define do  

  factory :job do
    drop_off_time Time.now
    sequence(:drop_off_location) { |n| "#{Faker::Name.first_name}_#{n}" }
    walk_duration 15
    pick_up_location Faker::Name.first_name
    pick_up_time Time.now + 15 * 60
    
    owner_first_name Faker::Name.first_name
    owner_last_name Faker::Name.last_name
    owner_phone '555-555-5555'
    owner_emergency_phone '555-555-5555'
    owner_building_name 'Ruby'
    
    association :user
    association :pup

    factory :invalid_job do
      pup_id nil
    end

  end

end