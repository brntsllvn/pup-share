require 'rails_helper'

feature 'User signs in' do

  let(:user) { create(:user, password: 'lolololol', password_confirmation: 'lolololol') } 

  scenario 'success' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign in'
    expect(page).to have_content 'Signed in successfully'
  end

  #   scenario 'with valid email and password' do
  #     sign_in
  #     expect(page).to have_content 'Signed in successfully'
  #   end

  scenario 'Signing in with bad credentials' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'booger' # incorrect
    click_on 'Sign in'
    expect(page).to have_content 'Invalid email or password'
  end
end