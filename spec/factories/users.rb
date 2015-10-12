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

    factory :owner do
      first_name 'Owny-Bonie'
    end

    factory :walker do
      first_name 'Walkie'
    end
  end

  #   # users w/ pups = owner
  #   factory :owner, class: User do
  #     transient do
  #       pups_count 3
  #     end
  #     after(:create) do |user, evaluator|
  #       create_list(:pup, evaluator.pups_count, owner: user)
  #       # may need to update final argument if I drop user attribute from pup in favor of owner
  #     end
  #   end # :user_with_pups

  #   # user w/ offers = walker
  #   factory :walker, class: User do
  #     transient do
  #       offers_count 2
  #     end
  #     after(:create) do |user, evaluator|
  #       create_list(:offer, evaluator.offers_count, user: user)
  #       # may need to update final argument if I drop user attribute from offer in favor of walker
  #     end
  #   end # :user_with_offers

  #   factory :user_w_walks_and_offers, class: User do
  #     transient do
  #       upcoming_walks_count 2
  #       past_walks_count 2
  #       offers_count 3
  #     end
  #     after(:create) do |user, evaluator|
  #       create_list(:upcoming_walk, evaluator.upcoming_walks_count, owner: user)
  #       create_list(:offer, evaluator.offers_count, walker: user)
  #       # build_list does not support skipping validations. Here is a hack:
  #       3.times do
  #         w = build(:past_walk, owner: user)
  #         w.save validate: false
  #       end
  #     end
  #   end # :user_w_walks_and_offer_of_nonspecific_times

end # :user

