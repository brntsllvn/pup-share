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
    # hacker can see, but not destroy
    visit user_path owner
    expect(page).to have_content(Location.last.full_street_address)
    expect{ 
      first('.btn-danger').click
      }.to change(Location, :count).by(0)
  end
end