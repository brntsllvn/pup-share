require 'rails_helper'

feature 'Owner selects walker' do

  let (:owner)  { create(:user) }
  let (:walker) { create(:user) }
  let (:other)  { create(:user) }

  background do
    # owner creates pup and walk
    sign_in owner
    click_on 'Post a Walk'
    create_phone_number
    create_location
    create_pup
    create_walk
    click_on 'Sign Out'
    # walker offers
    sign_in walker
    click_on 'Walk a Pup'
    expect{click_on 'Walk this pup!'}.to change(Offer, :count).by (1)
    click_on "#{walker.first_name}'s Upcoming Walks"
    expect(page).to have_no_link('accept-offer')
    click_on 'Sign Out'
  end

  scenario 'success' do # , js: true
    sign_in owner
    click_on "#{owner.first_name}'s Upcoming Walks"
    # owner has not chosen a walker yet
    expect(page).to have_content("#{walker.first_name}")
    # owner selects walker by clicking button
    click_link 'accept-offer'
    ### see alert pop-up
    ### click 'OK' on pup up
    ### puts page.driver.browser.alert.text, this does not really work
    # owner confirms
    expect(page).to have_content('Offer accepted')
    click_on 'Sign Out'
    # random person should not be able to make an offer if a walker has been selected
    sign_in other
    click_on 'Walk a Pup'
    expect(page).to have_no_content('Walk this pup!')
  end
end