require 'rails_helper'

feature 'Owner selects walker' do

  let (:owner)  { create(:user) }
  let (:walker) { create(:user) }

  background do
    # owner creates pup and walk
    sign_in owner
    visit user_path(owner)
    create_pup('Ace', 'Lab', 'M', 4.0, '555-555-5555')
    visit walks_path
    create_walk
    click_on 'Sign Out'
    # walker offers to walk
    sign_in walker
    click_on 'Walk a Pup' 
    expect{click_on 'Walk this pup!'}.to change(Offer, :count).by (1)
    click_on 'Sign Out'
  end

  scenario 'success' do # , :js => true 
    sign_in owner
    visit user_upcoming_walks_path(owner)
    # owner has not chosen a walker yet
    expect(page).to have_content('Nobody yet')
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
    # 'Nobody yet' disappears
    expect(page).to have_no_content('Nobody yet')
    # 'Accept offer' disappears
    expect(page).to have_no_content('Accept offer')
  end
end 