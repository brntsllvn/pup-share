require 'rails_helper'

feature 'End real life walk' do

  let (:owner)  { create(:user) }
  let (:walker) { create(:user) }

  background do
    # sign in
    sign_in owner
    click_on 'Post a Walk'
    # create mobile
    create_phone_number
    # location
    create_location
    # pup
    create_pup
    # walk
    create_walk
    # sign owner out
    click_on 'Sign Out'
    # walker offers
    sign_in walker
    click_on 'Walk a Pup' 
    click_on 'Walk this pup!'
    click_on 'Sign Out'
    # owner accepts
    sign_in owner
    visit user_upcoming_walks_path(owner)
    click_link 'accept-offer'
    click_on 'Sign Out'
    # time warp
    Walk.last.update_attributes(begin_time: Time.now + 5.minutes)
    # walker starts walk
    sign_in walker
    click_on "#{walker.first_name}'s Upcoming Walks"
    click_on 'Start Walk'
    # walk begins in the real world
  end

  scenario 'success' do
    # walker ends walk
    click_on 'End Walk'    
    expect(page).to have_content('Walk updated')
    expect(page).to have_content('Walk officially ended')
  end
end