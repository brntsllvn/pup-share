require 'rails_helper'

feature 'User destroys phone number' do

  let (:owner)        { create(:user) }
  let (:someone_else) { create(:user) }

  scenario 'success' do
    sign_in owner
    create_phone_number
    expect{ 
      click_on "Profile & Pups"
      first('.btn-danger').click
      }.to change(PhoneNumber, :count).by(-1)
    expect(page).to have_content 'Number destroyed'
  end

  scenario 'failure' do
    sign_in owner
    create_phone_number
    click_on 'Sign Out'
    sign_in someone_else
    visit user_path owner
    expect(page).to have_no_content(PhoneNumber.last.number) # not visible
  end
end