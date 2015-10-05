require 'rails_helper'

feature 'Start real life walk' do

  let (:owner)  { create(:user) }
  let (:walker) { create(:user) }

  background do
    # owner creates pup and walk
    sign_in owner
    create_pup('Ace', 'Lab', 'M', 4.0, '555-555-5555')
    click_on 'Walk a Pup'
    create_walk
    # walk not yet visible b/c too far in the future
    expect(page).to have_no_content('Start Walk')
    # make walk 5min from now to simulate time passing
    Walk.last.update_attributes(begin_time: Time.now + 5.minutes)
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
    # walk begins in 5 minutes
    # owner starts walk
    click_on 'My Upcoming Walks'
    click_on 'Start Walk'
    click_on 'Sign Out'
    # walker starts walk
    sign_in walker
    click_on 'My Upcoming Walks'
    click_on 'Start Walk'
    # walk begins in the real world
  end

  scenario 'success' do
    # walker ends walk
    visit root_path
    click_on 'My Upcoming Walks'
    click_on 'End Walk'    
    expect(page).to have_content('Walk updated')
    click_on 'Sign Out'
    # owner ends walk
    sign_in owner
    click_on 'My Upcoming Walks'
    click_on 'End Walk'
    expect(page).to have_content('Walk updated')
    # walk concludes
    expect(page).to have_content('Walk officially ended')
    Walk.last.update_attributes(end_time: Time.now)
    # walk moved to 'My Past Walks'
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