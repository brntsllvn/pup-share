require 'rails_helper'

feature 'User offers to walk a pup' do

  let (:user)   { create(:user) }
  let (:walker) { create(:user) }

  scenario 'success' do
    # sign in
    sign_in user.email, user.password
    # create pup
    visit user_path(user)
    create_pup('Ace', 'Lab', 'M', 4.0, '555-555-5555', true)
    expect(page).to have_content 'Drop off location'
    # create job
    visit jobs_path
    click_on 'Post a Walk'
    expect(current_path).to eql(new_job_path)
    choose "job_pup_id_#{Pup.last.id}"
    fill_in 'Drop off location', with: 'some place'    
    select Time.at(Time.now + 1.year).year.to_s, from: "job[drop_off_time(1i)]" 
    choose 'job_walk_duration_10'
    fill_in 'Pick up location', with: 'some other place'     
    click_on 'Create Job'

    click_on 'Sign Out'
    expect(page).to have_content 'Signed out successfully.'
    sign_in(walker.email, walker.password)
    expect(page).to have_content 'Signed in successfully'
    # offer
    click_on 'Walk a Pup' 
    expect(page).to have_content 'These pups need a walk!'
    # checks request submitted
    click_on 'Walk this pup!'
    expect(page).to have_content 'Offer to walk sent to the owner.'
    # checks the job changes status
    expect(page).to have_content 'Rescind Offer' 
  end
end