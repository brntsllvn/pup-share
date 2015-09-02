require 'rails_helper'

feature 'Creating new job' do

  let (:user) { create(:user) }

  scenario 'not logged in' do
    visit jobs_path
    click_on 'Find a Walker'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

  scenario 'without pup' do
    # sign in
    sign_in(user.email, user.password)
    # no pup
    visit jobs_path
    click_on 'Find a Walker'
    expect(page).to have_content 'Create a pup to add to your job'
  end

  scenario 'with pup' do
    # sign in
    sign_in(user.email, user.password)
    # create pup
    visit user_path(user)
    create_pup('Ace', 'Lab', 'M', 4.0, '555-555-5555', true)
    expect(page).to have_content 'Find a Walker'
    # create job
    visit jobs_path
    click_on 'Find a Walker'
    expect(current_path).to eql(new_job_path)
    choose "job_pup_id_#{Pup.last.id}"
    fill_in 'Drop off location', with: 'some place'    
    select '2016', from: "job[drop_off_time(1i)]" 
    choose 'job_walk_duration_10'
    fill_in 'Pick up location', with: 'some other place'     
    click_on 'Create Job'
    expect(page).to have_content 'Job created'
  end
end