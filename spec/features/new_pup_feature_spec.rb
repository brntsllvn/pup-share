require 'rails_helper'

feature 'User creates a new pup' do

  let (:user) { create(:user) }

  background do
    sign_in user
    click_on "Profile \& Pups"
    expect(page).to have_content 'New Pup'
  end

  scenario 'success' do
    expect{
      create_pup('Ace', 'Lab', 'M', '555-555-5555')
      }.to change(Pup, :count).by(1)
    expect(page).to have_content 'You created a pup'
  end

  context 'fails when' do
    scenario 'pup name blank' do
      create_pup(nil, 'Lab', 'M', '555-555-5555')
      expect(page).to have_content "can't be blank"
    end

    scenario 'pup vet phone blank' do
      create_pup('Ace', 'Lab', 'M', nil)
      expect(page).to have_content "can't be blank"
    end

    scenario 'pup vet phone wrong format' do
      create_pup(nil, 'Lab', 'M', '55-5-555-55:55')
      expect(page).to have_content "Please format like: 555-555-5555"
    end

    scenario 'pup breed blank' do
      create_pup('Ace', nil, 'M', '555-555-5555')
      expect(page).to have_content "can't be blank" 
    end
  end
end