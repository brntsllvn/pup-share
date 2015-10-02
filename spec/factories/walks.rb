FactoryGirl.define do  

  factory :walk do
    begin_time Time.now + 1.hour
    begin_location 'Your desk'
    duration 15
    end_time Time.now + 2.hours
    end_location Faker::Name.first_name

    association :user
    association :pup

    factory :upcoming_walk do
      begin_time Time.now + 1.hour
      end_time Time.now + 2.hours
    end # :upcoming_walk

    factory :past_walk do
      begin_time Time.now - 2.hours
      end_time Time.now - 1.hour
    end # :past_walk

    factory :walk_with_offers do
      transient do
        offers_count 6
      end
      after(:create) do |walk, evaluator|
        create_list(:upcoming_walk, evaluator.offers_count, walk: walk)
      end
    end # :walk_with_offers
    
  end
end