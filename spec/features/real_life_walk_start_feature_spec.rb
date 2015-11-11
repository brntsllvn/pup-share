require 'rails_helper'

feature 'Start real life walk' do

  let (:owner)  { create(:user) }
  let (:walker) { create(:user) }

  background do
    # sign in
    sign_in owner
    click_on 'Request a Walker'
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
    click_on "#{owner.first_name}'s Upcoming Walks"
    click_link 'accept-offer'
    click_on 'Sign Out'
  end

  scenario 'success' do
    sign_in walker
    # walker starts walk
    click_on "#{walker.first_name}'s Offers"
    expect(page).to have_content('Rescind Offer')
    # time warp
    Walk.last.update_attributes(begin_time: Time.now + 5.minutes)
    click_on "#{walker.first_name}'s Offers" # refresh page
    click_on 'Start Walk'
    # walk begins in the real world
    expect(page).to have_content('End Walk')
  end
end