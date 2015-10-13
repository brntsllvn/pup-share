require 'rails_helper'

feature 'Owner selects walker' do

  let (:owner)  { create(:user) }
  let (:walker) { create(:user) }

  background do
    # owner creates pup and walk
    sign_in owner
    create_pup('Ace', 'Lab', 'M')
    click_on 'Post a Walk'
    create_walk
    click_on 'Sign Out'
    # walker offers to walk
    sign_in walker
    click_on 'Walk a Pup'
    expect{click_on 'Walk this pup!'}.to change(Offer, :count).by (1)
    click_on 'My Upcoming Walks'
    # 'Accept offer' button only visible to pup's owner
    expect(page).to have_no_content('Accept offer')
    expect(page).to have_content('Offers')
    expect(page).to have_content('Ace')
    click_on 'Sign Out'
  end

  scenario 'success' do # , js: true
    sign_in owner
    click_on 'My Upcoming Walks'
    # owner has not chosen a walker yet
    expect(page).to have_content('Offers')
    # owner can see offer
    expect(page).to have_content(walker.first_name)
    expect(page).to have_content('Accept offer') # button
    # owner selects walker by clicking button
    click_on 'Accept offer'
    ### see alert pop-up
    ### click 'OK' on pup up
    ### puts page.driver.browser.alert.text, this does not really work
    # owner confirms
    expect(page).to have_content('Walk updated')
    # 'Nobody yet', 'Accept offer', and 'Offers' disappear
    expect(page).to have_no_content('Accept offer')
    expect(page).to have_no_content('Offers')
  end
end