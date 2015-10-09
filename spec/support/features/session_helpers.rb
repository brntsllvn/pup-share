module Features
  module SessionHelpers
    def sign_in(user)
      OmniAuth.config.add_mock(:linkedin, {uid: user.uid })
      visit '/'
      expect(page).to have_no_content 'Sign Out'
      click_on 'in'
      expect(page).to have_content 'Sign Out'
      expect(page).to have_content 'hi there'
      visit user_path(user)
    end
  end
end