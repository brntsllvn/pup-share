require 'rails_helper'

feature 'Visitor send message' do

  let (:visitor) { create(:user) }

  background do
    visit '/'
    click_on 'Contact'
    expect(page).to have_content 'Say hello'
  end

  scenario 'success' do
    fill_in 'Name', with: 'Dave Wallace' 
    fill_in 'Email', with: 'SomeDude@me.com'
    choose 'visitor_message_message_type_bug'
    fill_in 'Message', with: 'Yo needs to fixed yore stuffs'
    click_on 'Submit'
    expect(page).to have_content 'Thanks for reaching out!'
  end

  context 'fails when' do
    scenario 'name blank' do
      fill_in 'Email', with: 'SomeDude@me.com'
      choose 'visitor_message_message_type_bug'
      fill_in 'Message', with: 'Yo needs to fixed yore stuffs'
      click_on 'Submit'
      expect(page).to have_content "can't be blank"
    end

    scenario 'email blank' do 
      fill_in 'Name', with: 'Dave Wallace' 
      choose 'visitor_message_message_type_bug'
      fill_in 'Message', with: 'Yo needs to fixed yore stuffs'
      click_on 'Submit'  
      expect(page).to have_content "can't be blank"
    end

    # scenario 'contact type blank' handled by schema default

    scenario 'message blank' do
      fill_in 'Name', with: 'Dave Wallace' 
      fill_in 'Email', with: 'SomeDude@me.com'
      choose 'visitor_message_message_type_bug'
      click_on 'Submit'
      expect(page).to have_content "can't be blank"
    end

    scenario 'email wrong format' do
      fill_in 'Name', with: 'Dave Wallace' 
      fill_in 'Email', with: 'SomeDude,,,me.com'
      choose 'visitor_message_message_type_bug'
      fill_in 'Message', with: 'Yo needs to fixed yore stuffs'
      click_on 'Submit'
      expect(page).to have_content 'Need a valid email address'
    end
  end
end