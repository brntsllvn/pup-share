FactoryGirl.define do  

  factory :pup do
    name 'Ace'
    breed 'Labrador Retriever'
    male_female 'M'
    pic 'some_file.png'
    age 4
    size 2
    personality 'mellow'

    association :owner
  end

end

