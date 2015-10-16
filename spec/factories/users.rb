include ActionDispatch::TestProcess

FactoryGirl.define do

  factory :user do
    first_name 'Dave'
    last_name 'Wallace'
    sequence(:email) { |i| "#{i}_#{Faker::Internet.email}" }
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

end

