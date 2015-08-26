require 'rails_helper'

feature 'User submits an offer to walk a pup' do

  let (:user)   { create(:user, password: 'lolololol', password_confirmation: 'lolololol') }
  let (:walker) { create(:user, password: 'lolololol', password_confirmation: 'lolololol') }
  
  scenario 'with pup' do
    # log in
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    expect(page).to have_content 'Signed in successfully'
    # create pup
    visit user_path(user)
    click_on 'New Pup'
    expect(page).to have_content 'New Pup'
    fill_in 'Pup name', with: 'Ace'
    fill_in 'Pup breed', with: 'Lab'
    choose "pup_pup_weight_small_0-25lbs"
    find(:css, "#pup_pup_gender_m").set(true)
    fill_in 'Pup age', with: 3.5
    fill_in 'Pup vet phone', with: '555-555-5555'
    choose "pup_spayed_neutered_true"
    choose "pup_special_needs_true"
    click_on 'Create Pup'
    expect(page).to have_content 'Schedule walk'
    # create job
    visit jobs_path
    click_on 'walker needed'
    expect(current_path).to eql(new_job_path)
    choose "job_pup_id_#{Pup.last.id}"
    fill_in 'Drop off location', with: 'some place'    
    select '2015', from: "job[drop_off_time(1i)]" 
    choose 'job_walk_duration_10'
    fill_in 'Pick up location', with: 'some other place'     
    click_on 'Create Job'
    expect(page).to have_content 'Job created'
    # sign out
    click_on 'Sign Out'
    expect(page).to have_content 'Signed out successfully.'
    # log in as walker
    visit new_user_session_path
    fill_in 'Email', with: walker.email
    fill_in 'Password', with: walker.password
    click_on 'Log in'
    expect(page).to have_content 'Signed in successfully'
    # offer to walk a pup
    click_on 'Walk a Pup'
    expect(page).to have_content 'Pups in need of a walk'
    click_on 'Walk this pup!'
    expect(page).to have_content 'Offer to walk sent to the owner.'
    # check job buttons are updated
    expect(page).to have_content 'I want to cancel my offer to walk this pup' # checks that the job changes status
    # check job moved to walker's "upcoming walks"
    click_on 'My Upcoming Walks'
    expect(page).to have_content 'I want to cancel my offer to walk this pup' # checks that a new request/offer was added
  end

end # 'User submits an offer to walk a pup'