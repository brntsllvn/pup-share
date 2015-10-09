FactoryGirl.define do  

  factory :offer do
    association :user
    association :walk
  end

end
