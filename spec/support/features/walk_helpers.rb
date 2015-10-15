module Features
  module WalkHelpers

    def create_mobile
      click_on 'Add Mobile'
      fill_in 'Mobile', with: '555-555-5555'
      click_on 'Update Profile'
    end

    def create_location
      click_on 'Add Location'
      # fill out new location form
      fill_in 'Desk', with: 'xyz-123'
      fill_in 'Building', with: 'Ruby'
      fill_in 'Full street address', with: "500 5th Ave N, Seattle, WA 98109"
      click_on 'Create Location'
    end

    def create_pup(name, breed, gender)
      click_on 'Add Pup'
      # fill out new pup form
      fill_in 'Name', with: name
      fill_in 'Breed', with: breed
      find(:css, "#pup_male_female_m").set(true)
      fill_in 'Age', with: 4
      fill_in 'Weight', with: 71
      click_on 'Create Pup'
    end

    def create_walk
      click_on 'Post a Walk'
      # fill out new walk form
      choose "walk_mobile_555-555-5555" # hard-coded using phone number from above
      choose "walk_location_id_#{Location.last.id}"
      choose "walk_pup_id_#{Pup.last.id}"  
      select Time.now.year + 1, from: "walk[begin_time(1i)]" 
      choose 'walk_duration_15'    
      click_on 'Create Walk'
    end

  end
end