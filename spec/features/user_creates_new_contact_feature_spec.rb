require 'rails_helper'

feature 'Users submits contact form' do

  let (:user) { create(:user) }

  background do
    visit '/'
    click_on 'Contact'
    expect(page).to have_content 'Submit a comment'
  end

  scenario 'success' do
    fill_in 'Name', with: 'Dave Wallace' 
    fill_in 'Email', with: 'SomeDude@me.com'
    fill_in 'Company', with: 'Intec LLC'
    choose 'contact_form_contact_type_comment'
    fill_in 'Comment', with: 'Yo needs to fixed yore stuffs'
    click_on 'Submit'
    expect(page).to have_content 'Thanks for reaching out!'
  end

  context 'fails when' do
    scenario 'name blank' do
      fill_in 'Email', with: 'SomeDude@me.com'
      fill_in 'Company', with: 'Intec LLC'
      choose 'contact_form_contact_type_comment'
      fill_in 'Comment', with: 'Yo needs to fixed yore stuffs'
      click_on 'Submit'
      expect(page).to have_content "can't be blank"
    end

    scenario 'email blank' do 
      fill_in 'Name', with: 'Dave Wallace' 
      fill_in 'Company', with: 'Intec LLC'
      choose 'contact_form_contact_type_comment'
      fill_in 'Comment', with: 'Yo needs to fixed yore stuffs'
      click_on 'Submit'  
      expect(page).to have_content "can't be blank"
    end

    scenario 'company blank' do
      fill_in 'Email', with: 'SomeDude@me.com'
      choose 'contact_form_contact_type_comment'
      fill_in 'Comment', with: 'Yo needs to fixed yore stuffs'
      click_on 'Submit'
      expect(page).to have_content "can't be blank"
    end

    # scenario 'contact type blank' handled by schema default

    scenario 'comment blank' do
      fill_in 'Name', with: 'Dave Wallace' 
      fill_in 'Email', with: 'SomeDude@me.com'
      fill_in 'Company', with: 'Intec LLC'
      choose 'contact_form_contact_type_comment'
      click_on 'Submit'
      expect(page).to have_content "can't be blank"
    end

    scenario 'email wrong format' do
      fill_in 'Name', with: 'Dave Wallace' 
      fill_in 'Email', with: 'SomeDude,,,me.com'
      fill_in 'Company', with: 'Intec LLC'
      choose 'contact_form_contact_type_comment'
      fill_in 'Comment', with: 'Yo needs to fixed yore stuffs'
      click_on 'Submit'
      expect(page).to have_content 'Need a valid email address'
    end
  end
end