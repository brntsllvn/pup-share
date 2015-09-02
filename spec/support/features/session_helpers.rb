module Features
  module SessionHelpers
    def sign_in(email, password)
      visit '/'
      find_by_id('nav-sign-in').click
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_button 'Sign in'
    end
  end
end