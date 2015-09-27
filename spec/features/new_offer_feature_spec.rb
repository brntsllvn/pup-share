require 'rails_helper'

feature 'User offers to walk a pup' do

  let (:owner)  { create(:user) }
  let (:walker) { create(:user) }

  scenario 'success' do
    # sign in
    sign_in owner
    # pup
    visit user_path(owner)
    create_pup('Ace', 'Lab', 'M', 4.0, '555-555-5555')
    # walk
    visit walks_path
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