FactoryGirl.define do  

  factory :pup do
    pup_name 'Ace'
    pup_breed 'Labrador Retriever'
    pup_weight 65
    pup_gender 'Male'
    pup_vet_phone 555-555-5555
    pup_care_instructions 'Watch out! He\'s a jumper'
    pup_age 3
    spayed_neutered true
    
    # causes one file to be uploaded for every user created...
    # need a trash clean up for this...
    # committing 11,000+ pics to git probably not a good idea...
    # pup_pic { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app', 'assets', 'images', 'fallback', 'pup_walk.png')) }
    
    association :user
    
    factory :invalid_pup do
      pup_name nil
    end
  end

end

