require 'rails_helper'

feature 'Submitting contact form' do

  let (:user) { create(:user, password: 'lolololol', password_confirmation: 'lolololol') }

  scenario 'Successfully submit contact form' do
    visit '/'
    click_on 'Contact'
    expect(page).to have_content 'Submit a comment'
    fill_in 'Name', with: 'Dave Wallace' 
    fill_in 'Email', with: 'SomeDude@me.com'
    fill_in 'Company', with: 'Intec LLC'
    choose 'contact_form_contact_type_comment'
    fill_in 'Comment', with: 'Yo needs to fixed yore stuffs'
    click_on 'Submit'
    expect(page).to have_content 'Thanks for reaching out!'
  end

end
