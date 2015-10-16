require 'rails_helper'

feature 'User creates a new pup' do

  let (:owner) { create(:user) }

  background do
    sign_in owner
    click_on "Profile \& Pups"
    click_on 'Add Pup'
  end

  scenario 'success' do
    expect{
      fill_in 'Name', with: 'Ace'
      fill_in 'Breed', with: 'Lab'
      find(:css, "#pup_male_female_m").set(true)
      fill_in 'Age', with: 4
      fill_in 'Weight', with: 71
      click_on 'Create Pup'
      }.to change(Pup, :count).by(1)
    expect(page).to have_content 'Pup added'
  end

  context 'fails when' do
    scenario 'pup name blank' do
      click_on 'Create Pup'
      expect(page).to have_content "can't be blank"
    end

    scenario 'pup breed blank' do
      click_on 'Create Pup'
      expect(page).to have_content "can't be blank" 
    end
  end
end