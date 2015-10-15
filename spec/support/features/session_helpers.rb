module Features
  module SessionHelpers

    def sign_in(user)  

      OmniAuth.config.add_mock(:linkedin, 
        {uid: user.uid, 
          info: { "email" => "infinite@jest.com",
            "first_name" => "Dave",
            "last_name" => "Wallace",
            "urls" => { "public_profile" => "www.example.com" },
            "location" => { "name" => "Greater Spokane area" }} 
          })

      visit '/'
      click_on 'in'
      expect(page).to have_content 'Sign Out'
      expect(page).to have_content 'hi there'
      visit user_path(user)
    end

  end
end