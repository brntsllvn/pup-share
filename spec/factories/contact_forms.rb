FactoryGirl.define do  

  factory :contact_form do
    name Faker::Name.first_name
    sequence(:email) { |n| "email#{n}@amazon.com" }
    company 'Amazon.com LLC'
    contact_type 'Bug Report'
    comment 'Click on the widget, click again. There it is.'

    factory :invalid_contact_form do
      name nil
    end
  end
end

