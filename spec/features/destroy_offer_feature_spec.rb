require 'rails_helper'

feature 'User destroys offer' do

  let (:owner)  { create(:user) }
  let (:walker) { create(:user) }

  scenario 'success' do
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
    # sign walker in
    sign_in walker
    # offer
    click_on 'Walk a Pup' 
    # checks request submitted
    click_on 'Walk this pup!'
    # checks the job changes status
    click_on 'Rescind Offer' 
    expect(page).to have_content 'Offer Rescinded'
  end
end