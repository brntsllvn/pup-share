require 'rails_helper'

feature 'User destroys pup' do

  let (:owner)        { create(:user) }
  let (:someone_else) { create(:user) }

  scenario 'success' do
    sign_in owner
    create_pup
    expect{ 
      click_on "Profile & Pups"
      first('.btn-danger').click
      }.to change(Pup, :count).by(-1)
    expect(page).to have_content 'Pup destroyed'
  end

  scenario 'failure' do
    sign_in owner
    create_pup
    click_on 'Sign Out'
    sign_in someone_else
    # hacker can see, but not destroy
    visit user_path owner
    expect(page).to have_content(Pup.last.name)
    expect{ 
      first('.btn-danger').click
      }.to change(Pup, :count).by(0)
  end
end