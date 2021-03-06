FactoryGirl.define do

  factory :walk do
    begin_time Time.now + 1.hour
    duration 15

    association :phone_number
    association :location
    association :owner # belongs_to
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
      offers_count 2
    end
    after(:create) do |offer, evaluator|
      create_list(:upcoming_walk, evaluator.offers_count, offer: offer)
    end
  end # :walk_with_offers

end
