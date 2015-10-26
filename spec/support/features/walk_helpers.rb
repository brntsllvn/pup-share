module Features
  module WalkHelpers

    def create_phone_number
      click_on 'Add Phone Number'
      # fill out phone form
      choose 'phone_number_phone_type_mobile'
      fill_in 'Number', with: '555-555-5555'
      click_on 'Create Phone number'
      expect(page).to have_content("Number added")
    end

    def create_location
      click_on 'Add Location'
      # fill out new location form
      fill_in 'Desk', with: 'xyz-123'
      fill_in 'Building', with: 'Ruby'
      fill_in 'Full street address', with: "500 5th Ave N, Seattle, WA 98109"
      click_on 'Create Location'
      expect(page).to have_content("Location added")
    end

    def create_pup
      click_on 'Add Pup'
      # fill out new pup form
      fill_in 'Name', with: 'Ace'
      fill_in 'Breed', with: 'Lab'
      fill_in 'Age', with: 4
      find(:css, "#pup_male_female_m").set(true)
      find(:css, "#pup_size_2").set(true)
      find(:css, "#pup_personality_mellow").set(true)
      click_on 'Create Pup'
      expect(page).to have_content("Pup added")
    end

    def create_walk
      click_on 'Post a Walk'
      # fill out new walk form
      choose "walk_phone_number_id_#{PhoneNumber.last.id}"
      choose "walk_location_id_#{Location.last.id}"
      choose "walk_pup_id_#{Pup.last.id}"  
      select Time.now.year + 1, from: "walk[begin_time(1i)]" 
      choose 'walk_duration_15'    
      click_on 'Create Walk'
    end

  end
end