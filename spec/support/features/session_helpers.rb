module Features
  module SessionHelpers
    def sign_in(user)
      OmniAuth.config.add_mock(:linkedin, {:uid => user.uid })
      visit '/'
      expect(page).to have_no_content 'Sign Out'
      click_link 'nav-sign-in' # image/button: Sign in with LinkedIn
      expect(page).to have_content 'Sign Out'
      expect(page).to have_content 'hi there'
    end
  end
end