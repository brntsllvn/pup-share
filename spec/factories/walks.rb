FactoryGirl.define do  

  factory :walk do
    begin_time Time.now + 1.hour
    duration 15

    association :user
    association :pup

    factory :upcoming_walk do
      begin_time Time.now + 1.hour
    end # :upcoming_walk

    factory :past_walk do
      begin_time Time.now - 2.hours
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