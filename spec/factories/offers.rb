FactoryGirl.define do  

  factory :offer do
    status Faker::Lorem.word
    
    association :user
    association :walk  
  end

end
