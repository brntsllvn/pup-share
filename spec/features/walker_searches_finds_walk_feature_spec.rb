require 'rails_helper'

feature 'Walker searches and finds a job' do

  let (:walker) { create(:user) }

  background do
    visit '/'
  end

  context 'not signed in' do
    scenario 'fail' do
      expect(page).to have_content 'Sign Up'
    end
  end

  context 'signed in' do
    scenario '' do

    end
  end



end