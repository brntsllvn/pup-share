FactoryGirl.define do  

  factory :pup do
    name 'Ace'
    breed 'Labrador Retriever'
    male_female 'M'
    pic 'some_file.png'
    walks_completed 100
    
    association :user
  end

end

