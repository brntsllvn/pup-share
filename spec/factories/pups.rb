FactoryGirl.define do  

  factory :pup do
    name 'Ace'
    breed 'Labrador Retriever'
    male_female 'M'
    vet_phone '555-555-5555'
    insurance_provider 'PupSafe'
    pic 'some_file.png'
    walks_completed 100
    
    association :user
  end

end

