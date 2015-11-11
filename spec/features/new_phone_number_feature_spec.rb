require 'rails_helper'

feature 'User adds phone number' do

  let (:owner) { create(:user) }

  background do 
    sign_in owner
  end

  scenario 'success' do
    expect{ create_phone_number }.to change(PhoneNumber, :count).by(1)
    expect(page).to have_content 'Number added'
  end

end