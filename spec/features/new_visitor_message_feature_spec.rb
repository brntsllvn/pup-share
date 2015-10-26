require 'rails_helper'

feature 'Visitor send message' do

  let (:visitor) { create(:user) }

  background do
    sign_in visitor
    visit new_visitor_message_path
    expect(page).to have_content 'Say hello'
  end

  scenario 'success' do
    choose 'visitor_message_message_type_bug'
    fill_in 'Message', with: 'Yo needs to fixed yore stuffs'
    click_on 'Submit'
    expect(page).to have_content 'Thanks for the message'
  end

  # scenario 'contact type blank' handled by schema default

  scenario 'message blank' do
    choose 'visitor_message_message_type_bug'
    click_on 'Submit'
    expect(page).to have_content "can't be blank"
  end
end