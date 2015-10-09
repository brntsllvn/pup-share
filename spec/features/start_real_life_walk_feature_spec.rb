require 'rails_helper'

feature 'Start real life walk' do

  let (:owner)  { create(:user) }
  let (:walker) { create(:user) }

  background do
    # owner creates pup and walk
    sign_in owner
    visit user_path(owner)
    create_pup('Ace', 'Lab', 'M', '555-555-5555')
    visit walks_path
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
    visit user_upcoming_walks_path(owner)
    click_on 'Accept offer'
  end

  scenario 'success' do
    # walk begins in 5 minutes
    # owner starts walk
    click_on 'My Upcoming Walks'
    click_on 'Start Walk'
    expect(page).to have_content('End Walk') # button
    click_on 'Sign Out'
    # walker starts walk
    sign_in walker
    click_on 'My Upcoming Walks'
    click_on 'Start Walk'
    expect(page).to have_content('End Walk') # button
    # walk begins in the real world
    expect(page).to have_content('Walk officially started')
  end
end