require 'rails_helper'

feature 'Owner responds to walk offer:' do

  let (:owner)  { create(:user) }
  let (:walker) { create(:user) }

  background do
    # sign in
    sign_in(owner.email, owner.password)
    # creates a pup
    visit user_path(owner)
    click_on 'New Pup'
    expect(page).to have_content 'New Pup'
    fill_in 'Pup name', with: 'Ace'
    fill_in 'Pup breed', with: 'Lab'
    find(:css, "#pup_pup_gender_m").set(true)
    fill_in 'Pup age', with: 3.5
    fill_in 'Pup vet phone', with: '555-555-5555'
    choose "pup_spayed_neutered_true"
    click_on 'Create Pup'
    # creates a job
    click_on 'Post a Walk'
    expect(current_path).to eql(new_job_path)
    choose "job_pup_id_#{Pup.last.id}"
    fill_in 'Drop off location', with: 'some place'    
    select '2016', from: "job[drop_off_time(1i)]" 
    choose 'job_walk_duration_10'
    fill_in 'Pick up location', with: 'some other place'     
    click_on 'Create Job'
    expect(page).to have_content 'Job created'
    # signs out
    click_on 'Sign Out'
    expect(page).to have_content 'Signed out successfully.'
  end

  scenario 'Owner approves' do
    # sign in as walker
    sign_in(walker.email, walker.password)
    # offer to walk a pup
    click_on 'Walk a Pup'
    expect(page).to have_content 'These pups need a walk!'
    click_on 'Walk this pup!'
    expect(page).to have_content 'Offer to walk sent to the owner.'
  end
end 