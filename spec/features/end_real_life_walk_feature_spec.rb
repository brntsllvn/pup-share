require 'rails_helper'

feature 'Start real life walk' do

  let (:owner)  { create(:user) }
  let (:walker) { create(:user) }

  background do
    # owner creates pup and walk
    sign_in owner
    create_pup('Ace', 'Lab', 'M')
    click_on 'Walk a Pup'
    create_walk
    click_on 'Sign Out'
    # walker offers to walk
    sign_in walker
    click_on 'Walk a Pup' 
    click_on 'Walk this pup!'
    click_on 'Sign Out'
    # owner accepts offer
    sign_in owner
    click_on 'My Upcoming Walks'
    click_on 'Accept offer'
    click_on 'Sign Out'
    # make walk 5min from now to simulate time passing
    Walk.last.update_attributes(begin_time: Time.now + 5.minutes)
    # walker starts walk
    sign_in walker
    click_on 'My Upcoming Walks'
    click_on 'Start Walk'
    # walk begins in the real world
  end

  scenario 'success' do
    # walker ends walk
    visit root_path
    click_on 'My Walks'
    click_on 'End Walk'    
    expect(page).to have_content('Walk updated')
    expect(page).to have_no_content('Walk officially started')
    expect(page).to have_content('Walk officially ended')
    click_on 'Sign Out'
    # walk concludes
    Walk.last.update_attribute(:begin_time, Time.now - 1.hour) # skip validations
    # walk moved to 'My Past Walks'
    sign_in owner
    click_on 'My Upcoming Walks' # refresh the page
    expect(page).to have_no_content('Ace')
    click_on 'Past Walks'
    expect(page).to have_content('Ace')
    click_on 'Sign Out'
    # walker: check views
    sign_in walker
    click_on 'My Upcoming Walks'
    expect(page).to have_no_content('Ace')
    click_on 'Past Walks'
    expect(page).to have_content('Ace')
  end
end