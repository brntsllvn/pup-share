require 'rails_helper'

feature 'Sign in with LinkedIn' do
  let(:owner)  { create(:user) } 
  
  scenario 'success' do
    sign_in(owner)
    binding.pry
  end
end