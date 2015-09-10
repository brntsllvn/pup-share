# require 'rails_helper'

# feature 'user sign up' do

#   background do
#     visit  '/'
#     click_button 'Sign Up'
#     expect(page).to have_content 'Register'
#   end

#   scenario 'success' do
#     sign_up_with('Dave', 'Wallace', '555-555-5555', '555-555-5555', 'Ruby', "Dave@Wallace.com", 'lolololo', 'lolololo')  
#     click_button 'Sign up'   
#     expect(page).to have_content 'A message with a confirmation link has been sent to your email address'
#     # confirmation email sent: Devise
#   end

#   context 'fails when' do
#     # scenario 'email blank' # Devise
#     # scenario 'password blank # Devise
#     # scenario 'password and confirmation not matching' # Devise
#     # scenario 'email alredy registered' # Devise

#     scenario 'first name blank' do
#       sign_up_with(nil, 'Wallace', '555-555-5555', '555-555-5555', 'Ruby', "Dave@Wallace.com", 'lolololo', 'lolololo')  
#       click_button 'Sign up'
#       expect(page).to have_content "can't be blank"
#     end

#     scenario 'last name blank' do
#       sign_up_with('Dave', nil, '555-555-5555', '555-555-5555', 'Ruby', "Dave@Wallace.com", 'lolololo', 'lolololo')   
#       click_button 'Sign up'
#       expect(page).to have_content "can't be blank"
#     end

#     scenario 'Phone blank' do
#       sign_up_with('Dave', 'Wallace', nil, '555-555-5555', 'Ruby', "Dave@Wallace.com", 'lolololo', 'lolololo')   
#       click_button 'Sign up'
#       expect(page).to have_content "can't be blank"
#     end 

#     scenario 'Phone wrong format' do
#       sign_up_with('Dave', 'Wallace', '555:555+5555', '555-555-5555', 'Ruby', "Dave@Wallace.com", 'lolololo', 'lolololo')   
#       click_button 'Sign up'
#       expect(page).to have_content 'Format: 555-555-5555'
#     end 

#     scenario 'Emergency Phone blank' do
#       sign_up_with('Dave', 'Wallace', '555-555-5555', nil, 'Ruby', "Dave@Wallace.com", 'lolololo', 'lolololo')   
#       click_button 'Sign up'
#       expect(page).to have_content "can't be blank"
#     end 

#     scenario 'Emergency Phone wrong format' do
#       sign_up_with('Dave', 'Wallace', '555-555-5555', '555:555+5555', 'Ruby', "Dave@Wallace.com", 'lolololo', 'lolololo')   
#       click_button 'Sign up'
#       expect(page).to have_content 'Format: 555-555-5555'
#     end 
#   end

#   def sign_up_with(first, last, phone, emergency, building, email, password, confirmation)
#     fill_in 'user_first_name', with: first
#     fill_in 'user_last_name', with: last
#     fill_in 'user_phone', with: phone
#     fill_in 'user_emergency_phone', with: emergency
#     fill_in 'user_building', with: building
#     fill_in 'user_email', with: email
#     fill_in 'user_password', with: password
#     fill_in 'user_password_confirmation', with: confirmation
#   end
# end
