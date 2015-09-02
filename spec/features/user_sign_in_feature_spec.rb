require 'rails_helper'

feature 'User signs in' do

  let(:user) { create(:user, password: 'lolololol', password_confirmation: 'lolololol') } 

  scenario 'with valid email and password' do
    sign_in(user.email, user.password)
    expect(page).to have_content 'Signed in successfully'
  end

  scenario 'with bad password' do
    sign_in(user.email, 'bad_password')
    expect(page).to have_content 'Invalid email or password'
  end
end