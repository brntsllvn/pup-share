require 'rails_helper'

feature 'User destroys phone number' do

  let (:owner)        { create(:user) }
  let (:someone_else) { create(:user) }

  background do
    sign_in owner
    create_phone_number
  end

  scenario 'success' do
    expect{ 
      click_on "Profile & Pups"
      first('.btn-danger').click
      }.to change(PhoneNumber, :count).by(-1)
    expect(page).to have_content 'Number destroyed'
  end

  scenario 'failure' do
    click_on 'Sign Out'
    sign_in someone_else
    expect{ 
      click_on "Profile & Pups"
      first('.btn-danger').click
      }.to change(PhoneNumber, :count).by(0)
  end

end