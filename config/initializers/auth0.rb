Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    'tDBdqyH5Tg0G2wBMzXAyOVmV2GbGWmI8',
    'gF1rC3SbNgKV-_3CkDaFaqBy6WR8SgwRj0EaS-zgbDf1CxIKhzQX9ST7jFMcNcC0',
    'pupshare.auth0.com',
    callback_path: "/auth/auth0/callback"
  )
end