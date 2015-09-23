require 'rails_helper'

feature 'Sign in with LinkedIn' do

  before do 
    OmniAuth.config.add_mock(:linkedin, {:uid => '12345'})
  end

  let(:user) { create(:user) } 

  scenario 'with valid email and password' do
    visit '/'
    expect(page).to have_no_content 'Sign Out'
    click_link 'nav-sign-in' # image/button: Sign in with LinkedIn
    expect(page).to have_content 'Sign Out'
  end
end