require 'rails_helper'

feature 'Create new walk' do

  let (:owner) { create(:user) }

  scenario 'fails when no pup' do
    visit '/'
    sign_in owner
    click_on 'Post a Walk'
    expect(page).to have_content 'Add a pup first'
    expect(page).to have_content 'New Pup'
  end

  scenario 'success' do
    expect{
      sign_in owner
      # create pup
      visit user_path(owner)
      create_pup('Ace', 'Lab', 'M')
      # create walk
      create_walk
      }.to change(Walk, :count).by (1)
    expect(page).to have_content 'Walk created'
  end
end