require 'rails_helper'

feature 'user sign up' do
  background do
#     visit  '/'
#     click_link 'sign up'
    # expect to see sign up form
#     expect(page).to have_content ''
  end

  scenario 'success' do
    # fill sign up form
    # submit sign up form

    # expect to see confirmation instructions
    # expect to see confirmation form'
    # expect to receive confirmation email'
  end

  context 'fails when' do
    scenario 'email blank' do
      # fill sign up form
      # empty email field
      # submit sign up form

      # expect to see sign up form
      # expect to see email missing message
    end

    scenario 'password blank' do
      # fill sign up form
      # empty password field
      # submit sign up form

      # expect to see sign up form
      # expect to see password missing message
    end

    scenario 'password and confirmation not matching' do
      # fill sign up form
      # empty password field
      # submit sign up form

      # expect to see sign up form
      # expect to see password missing message
    end

    scenario 'tos declined' do
      # fill sign up form
      # uncheck tos chechbox
      # submit sign up form

      # expect to see sign up form
      # expect to see tos acceptance required message
    end


    scenario 'email alredy registered' do
      # create user with email

      # fill sign up form
      # submit sign up form

      # expect to see sign up form
      # expect to see email already taken message
    end
  end
end
