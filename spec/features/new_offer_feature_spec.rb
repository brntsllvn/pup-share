require 'rails_helper'

feature 'User offers to walk a pup' do

  let (:owner)  { create(:user) }
  let (:walker) { create(:user) }

  scenario 'success' do
    # sign in
    sign_in owner
    click_on 'Post a Walk'
    create_mobile
    # location
    create_location
    # pup
    create_pup('Ace', 'Lab', 'M')
    # walk
    create_walk
    # sign owner out
    click_on 'Sign Out'
    # sign walker in
    sign_in walker
    # offer
    click_on 'Walk a Pup' 
    expect(page).to have_content 'Ace' # same name as pup created above
    # checks request submitted
    click_on 'Walk this pup!'
    expect(page).to have_content 'Offer to walk sent to the owner'
    # checks the job changes status
    expect(page).to have_content 'Rescind Offer' 
  end
end