require 'rails_helper'

feature 'Creating a new pup' do

  let(:user) { create(:user) }

  scenario 'Successfully creating a pup' do
    # log in
    log_in user
    expect(page).to have_content 'Signed in successfully'
    # navigate to Profile & Pups
    click_on "Profile \& Pups"
    expect(page).to have_content 'New Pup'
    # navigate to new pup form
    click_on 'New Pup'
    expect(page).to have_content 'Pup gender'
    # fill out new pup form
    fill_in 'Pup name', with: 'Ace'
    fill_in 'Pup breed', with: 'Lab'
    find(:css, "#pup_pup_gender_m").set(true)
    fill_in 'Pup age', with: 3.5
    fill_in 'Pup vet phone', with: '555-555-5555'
    choose 'pup_spayed_neutered_true'
    click_on 'Create Pup'
    expect(page).to have_content 'You created a pup'
  end

  def log_in(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign in'
  end

end