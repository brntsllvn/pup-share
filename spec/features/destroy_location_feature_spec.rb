require 'rails_helper'

feature 'User destroys location' do

  let (:owner)        { create(:user) }
  let (:someone_else) { create(:user) }

  scenario 'success' do
    sign_in owner
    create_location
    expect{ 
      click_on "Profile & Pups"
      first('.btn-danger').click
      }.to change(Location, :count).by(-1)
    expect(page).to have_content 'Location destroyed'
  end

  scenario 'failure' do
    sign_in owner
    create_location
    click_on 'Sign Out'
    sign_in someone_else
    visit user_path owner
    expect(page).to have_no_content(Location.last.full_street_address) # not visible
  end
end