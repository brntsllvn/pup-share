require 'rails_helper'

feature 'User adds location' do

  let (:owner) { create(:user) }

  background do
    sign_in owner
  end

  scenario 'success' do
    expect{ create_location }.to change(Location, :count).by(1)
    expect(page).to have_content 'Location added'
  end

  context 'fails when' do
    scenario 'full street address blank' do
      click_on 'Post a Walk'
      click_on 'Add Location'
      click_on 'Create Location'
      expect(page).to have_content "can't be blank"
    end
  end

end