module Features
  module PupHelpers
    def create_pup(name, breed, gender, age, vet_phone, spayed_neutered)
      click_on 'New Pup'
      # fill out new pup form
      fill_in 'Pup name', with: name
      fill_in 'Pup breed', with: breed
      find(:css, "#pup_pup_gender_m").set(true)
      fill_in 'Pup age', with: age
      fill_in 'Pup vet phone', with: vet_phone
      choose 'pup_spayed_neutered_true'
      click_on 'Create Pup'
    end
  end
end