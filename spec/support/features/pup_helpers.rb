module Features
  module PupHelpers
    def create_pup(name, breed, gender)
      click_on 'New Pup'
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
      expect(current_path).to eql(new_walk_path)
      fill_in 'Building', with: 'Ruby'
      fill_in 'Desk', with: 'xyz-123'
      fill_in 'Street', with: '111 West St.'
      fill_in 'City', with: 'New York'
      select 'Washington', from: 'walk[state]'
      fill_in 'Zip', with: '98111'
      choose "walk_pup_id_#{Pup.last.id}"  
      select Time.now.year + 1, from: "walk[begin_time(1i)]" 
      choose 'walk_duration_15'    
      click_on 'Create Walk'
    end
  end
end