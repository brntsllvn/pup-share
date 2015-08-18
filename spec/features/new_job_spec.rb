require 'rails_helper'

feature 'Creating new job' do

  let (:user) { FactoryGirl.create(:user, password: 'lolololol', password_confirmation: 'lolololol') }

  scenario 'while not logged in' do
    visit jobs_path
    click_on 'walker needed'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

  scenario 'while logged in' do
    # log in
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    expect(page).to have_content 'Signed in successfully'
    # 
    visit jobs_path
    click_on 'walker needed'
    expect(page).to have_content 'Create a pup to add to your job'
  end

  scenario 'without pup' do
    # log in
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    expect(page).to have_content 'Signed in successfully'
    # 
    visit jobs_path
    click_on 'walker needed'
    expect(page).to have_content 'Create a pup to add to your job'    
  end

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
  end
end
