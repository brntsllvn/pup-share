require 'rails_helper'

feature 'Walker searches and finds a walk' do

  let (:walker) { create(:user) }
  let (:owner)  { create(:user) }

  background do
    sign_in owner
    click_on 'Profile & Pups'
    create_pup('Ace','Lab','M',4,'555-555-5555')
    expect(page).to have_content 'You created a pup'    
    create_walk
    expect(page).to have_content 'Walk created'
    click_on 'Sign Out'
  end

  context 'not signed in' do
    scenario 'fail' do
      click_on 'Walk a Pup'
      expect(page).to have_content 'Sign in'
    end
  end

  context 'signed in' do
    scenario 'success' do
      sign_in walker
      click_on 'Walk a Pup'
      expect(current_path).to eql(walks_path)
      # see the walk/pup created above
      expect(page).to have_content 'Ace'
    end
  end



end