Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    ENV['AUTH0_LOCK'],
    ENV['AUTH0_CLIENT_SECRET'],
    'pupshare.auth0.com',
    callback_path: "/auth/auth0/callback"
  )
  
  provider :linkedin, ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET']
  # same thing for other providers
  
end