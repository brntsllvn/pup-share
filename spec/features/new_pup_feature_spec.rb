require 'rails_helper'

feature 'User creates a new pup' do

  let (:owner) { create(:user) }

  background do
    sign_in owner
    click_on "Profile \& Pups"
    expect(page).to have_content 'New Pup'
  end

  scenario 'success' do
    expect{
      create_pup('Ace', 'Lab', 'M')
      }.to change(Pup, :count).by(1)
    expect(page).to have_content 'You created a pup'
  end

  context 'fails when' do
    scenario 'pup name blank' do
      create_pup(nil, 'Lab', 'M')
      expect(page).to have_content "can't be blank"
    end

    scenario 'pup breed blank' do
      create_pup('Ace', nil, 'M')
      expect(page).to have_content "can't be blank" 
    end
  end
end