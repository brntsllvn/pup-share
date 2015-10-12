FactoryGirl.define do

  factory :walk do
    begin_time Time.now + 1.hour
    duration 15
    desk "xyz-123"
    building "Ruby"
    street "111 Harvard Ave. E"
    city "Seattle"
    state "Washington"
    zip "98111"

    association :owner
    association :walker
    association :pup
  end

  factory :upcoming_walk, class: Walk do
    begin_time Time.now + 1.hour
  end # :upcoming_walk

  factory :past_walk, class: Walk do
    begin_time Time.now - 2.hours
  end # :past_walk

  factory :walk_with_offers, class: Walk do
    transient do
      offers_count 6
    end
    after(:create) do |offer, evaluator|
      create_list(:upcoming_walk, evaluator.offers_count, offer: offer)
    end
  end # :walk_with_offers

end
