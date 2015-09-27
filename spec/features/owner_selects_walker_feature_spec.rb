require 'rails_helper'

feature 'Owner selects walker' do

  let (:owner)  { create(:user) }
  let (:walker) { create(:user) }

  background do
    # owner creates a pup and walk
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

  scenario 'success' do
    sign_in owner
    visit user_upcoming_walks_path(owner)
    # owner can see offer to walk
    expect(page).to have_content(walker.uid)
    
  end
end 