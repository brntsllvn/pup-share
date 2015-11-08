require 'rails_helper'

feature 'User edits pup' do

  let (:owner)        { create(:user) }

  background do
    sign_in owner
    create_pup
    click_on 'Profile & Pups'
    first('.btn-warning').click
    expect(page).to have_content 'Edit Pup'    
  end

  scenario 'success' do
    fill_in 'Name', with: 'Something new and original'
    click_on 'Update Pup'
    expect(page).to have_content 'Pupdated'
  end

  scenario 'failure' do
    fill_in 'Name', with: ''
    click_on 'Update Pup'
    expect(page).to have_content "can't be blank"
  end

end