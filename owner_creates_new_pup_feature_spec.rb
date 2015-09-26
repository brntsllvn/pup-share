require 'rails_helper'

feature 'User creates a new pup' do

  let (:user) { create(:user) }

  background do
    sign_in user.email, user.password
    click_on "Profile \& Pups"
    expect(page).to have_content 'New Pup'
  end

  scenario 'success' do
    create_pup('Ace', 'Lab', 'M', 4.0, '555-555-5555', true)
    expect(page).to have_content 'You created a pup'
  end

  context 'fails when' do
    scenario 'pup name blank' do
      create_pup(nil, 'Lab', 'M', 4.0, '555-555-5555', true)
      expect(page).to have_content "can't be blank"
    end

    # scenario 'pup gender blank' # handled by schema default value

    scenario 'pup vet phone blank' do
      create_pup('Ace', 'Lab', 'M', 4.0, nil, true)
      expect(page).to have_content "can't be blank"
    end

    scenario 'pup vet phone wrong format' do
      create_pup(nil, 'Lab', 'M', 4.0, '55-5-555-55:55', true)
      expect(page).to have_content "Please format like: 555-555-5555"
    end

    scenario 'pup age blank' do
      create_pup('Ace', 'Lab', 'M', nil, '555-555-5555', true)
      expect(page).to have_content "can't be blank"
    end

    scenario 'pup age non-numeric' do
      create_pup('Ace', 'Lab', 'M', 'five', '555-555-5555', true)
      expect(page).to have_content 'is not a number'
    end

    # scenario 'spayed_neutered blank' # handled by schema default

    scenario 'pup breed blank' do
      create_pup('Ace', nil, 'M', 4.0, '555-555-5555', true)
      expect(page).to have_content "can't be blank" 
    end
  end
end