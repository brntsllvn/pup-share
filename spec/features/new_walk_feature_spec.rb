require 'rails_helper'

feature 'Create new walk' do

  let (:owner) { create(:user) }

  background :each do
    visit '/'
    sign_in owner
    click_on 'Request a Walker'
    click_on 'Create Walk'
  end

  scenario 'fails when no mobile' do
    expect(page).to have_content 'can\'t be blank'
    expect(page).to have_content 'Add Phone Number'
  end

  scenario 'fails when no location' do
    expect(page).to have_content 'can\'t be blank'
    expect(page).to have_content 'Add Location'
  end

  scenario 'fails when no pup' do
    expect(page).to have_content 'can\'t be blank'
    expect(page).to have_content 'Add Pup'
  end

  scenario 'success' do
    expect{
      click_on 'Request a Walker'
      # create mobile
      create_phone_number
      # create location
      create_location
      # create pup
      create_pup
      # create walk
      create_walk
      }.to change(Walk, :count).by (1)
    expect(page).to have_content 'Walk created'
  end
end