require 'rails_helper'

feature 'User offers to walk a pup' do

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
    expect(page).to have_content Pup.last.name
    # offer
    click_on 'Walk this pup!'
    # test mailer
    open_email('infinite@jest.com')
    expect(current_email).to have_content 'PupShare: Someone Offered to Walk your Pup'
    # notification
    expect(page).to have_content 'Offer to walk sent to the owner'
    # checks the job changes status
    expect(page).to have_content 'Rescind Offer' 
  end
end