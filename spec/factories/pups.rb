FactoryGirl.define do  

  factory :pup do
    name 'Ace'
    breed 'Labrador Retriever'
    male_female 'M'
    vet_phone '555-555-5555'
    vet_name "#{Faker::Name.first_name} #{Faker::Name.last_name}"
    care_instructions "Watch out! He's a jumper!"
    age 3
    insurance_provider 'PupSafe'
    pic 'some_file.png'
    walks_completed 100
    
    association :user
  end

end

