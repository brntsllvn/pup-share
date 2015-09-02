require 'rails_helper'

feature 'User submits an offer to walk a pup' do

  let (:user)   { create(:user, password: 'lolololol', password_confirmation: 'lolololol') }
  let (:walker) { create(:user, password: 'lolololol', password_confirmation: 'lolololol') }
  
  scenario 'with pup' do
    # sign in
    sign_in(user.email, user.password)
    # create pup
    visit user_path(user)
    click_on 'New Pup'
    expect(page).to have_content 'New Pup'
    fill_in 'Pup name', with: 'Ace'
    fill_in 'Pup breed', with: 'Lab'
    find(:css, "#pup_pup_gender_m").set(true)
    fill_in 'Pup age', with: 3.5
    fill_in 'Pup vet phone', with: '555-555-5555'
    choose "pup_spayed_neutered_true"
    click_on 'Create Pup'
    expect(page).to have_content 'Find a Walker'
    # create job
    visit jobs_path
    click_on 'Find a Walker'
    expect(current_path).to eql(new_job_path)
    choose "job_pup_id_#{Pup.last.id}"
    fill_in 'Drop off location', with: 'some place'    
    select Time.at(Time.now + 1.year).year.to_s, from: "job[drop_off_time(1i)]" 
    choose 'job_walk_duration_10'
    fill_in 'Pick up location', with: 'some other place'     
    click_on 'Create Job'
    expect(page).to have_content 'Job created'
    # sign out
    click_on 'Sign Out'
    expect(page).to have_content 'Signed out successfully.'
    # log in as walker
    sign_in(walker.email, walker.password)
    expect(page).to have_content 'Signed in successfully'
    # offer to walk a pup
    click_on 'Walk a Pup'
    expect(page).to have_content 'These pups need a walk!'
    click_on 'Walk this pup!'
    expect(page).to have_content 'Offer to walk sent to the owner.'
    # check job buttons are updated
    expect(page).to have_content 'Cancel my offer to walk this pup' # checks that the job changes status
    # check job moved to walker's "upcoming walks"
    click_on 'My Upcoming Walks'
    expect(page).to have_content 'Cancel my offer to walk this pup' # checks that a new request/offer was added
  end
end