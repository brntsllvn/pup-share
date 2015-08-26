require 'rails_helper'

feature 'User updates password' do

  let(:user) { create(:user, password: 'lolololol', password_confirmation: 'lolololol') } 

  scenario 'with VALID credentials' do
    # sign in
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    expect(page).to have_content 'Signed in successfully'
    # change password
    visit edit_user_registration_path
    expect(page).to have_content 'Change Password'
    fill_in 'Password', with: user.password + 'hi'
    fill_in 'Password confirmation', with: user.password + 'hi'
    fill_in 'Current password', with: user.password
    click_on 'Update'
    expect(page).to have_content 'Your account has been updated successfully'
  end

end