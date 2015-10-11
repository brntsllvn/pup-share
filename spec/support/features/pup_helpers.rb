module Features
  module PupHelpers
    def create_pup(name, breed, gender)
      click_on 'New Pup'
      # fill out new pup form
      fill_in 'Name', with: name
      fill_in 'Breed', with: breed
      find(:css, "#pup_male_female_m").set(true)
      click_on 'Create Pup'
    end

    def create_walk
      click_on 'Post a Walk'
      # fill out new walk form
      expect(current_path).to eql(new_walk_path)
      choose "walk_pup_id_#{Pup.last.id}"  
      select Time.now.year + 1, from: "walk[begin_time(1i)]" 
      choose 'walk_duration_15'    
      click_on 'Create Walk'
    end
  end
end