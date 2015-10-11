Rails.application.config.middleware.use OmniAuth::Builder do

  if Rails.env.production?
    provider :linkedin, ENV['LINKEDIN_KEY_PROD'], ENV['LINKEDIN_SECRET_PROD']
  elsif Rails.env.development?
    provider :linkedin, ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET']
  end

end