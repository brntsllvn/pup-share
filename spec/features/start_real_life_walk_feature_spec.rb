require 'rails_helper'

feature 'Start real life walk' do

  let (:owner)  { create(:user) }
  let (:walker) { create(:user) }

  background do
    # sign in
    sign_in owner
    click_on 'Post a Walk'
    # mobile
    create_mobile
    # location
    create_location
    # pup
    create_pup('Ace', 'Lab', 'M')
    # walk
    create_walk
    # sign owner out
    click_on 'Sign Out'
    # time warp
    Walk.last.update_attributes(begin_time: Time.now + 5.minutes)
    # walker offers to walk
    sign_in walker
    click_on 'Walk a Pup' 
    click_on 'Walk this pup!'
    click_on 'Sign Out'
    # owner accepts offer
    sign_in owner
    visit user_upcoming_walks_path(owner)
    click_on 'Accept offer'
    click_on 'Sign Out'
  end

  scenario 'success' do
    # walker starts walk
    sign_in walker
    click_on 'My Upcoming Walks'
    click_on 'Start Walk'
    # walk begins in the real world
    expect(page).to have_content('Walk officially started')
  end
end