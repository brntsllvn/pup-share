include ActionDispatch::TestProcess

FactoryGirl.define do  

  factory :user do
    first_name Faker::Name.first_name
    last_name 'Wallace'  
    phone '555-555-5555'
    emergency_phone '555-555-5555'
    sequence(:email) { |n| "email#{n}@amazon.com" }
    password 'lalalala'
    password_confirmation 'lalalala'
    confirmed_at Time.now
    building 'Ruby'

    # causes one file to be uploaded for every user created...
    # need a trash clean up for this...
    # committing 11,000+ pics to git probably not a good idea...
    # pic { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images', 'pup.jpg')) }

    factory :invalid_user do
      email "invalid-email@gmail.com"
    end

    factory :pup_owner do
      email "pup-owner@amazon.com"
    end
  end
end