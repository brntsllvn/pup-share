# Be sure to restart your server when you modify this file.

# this setting caused Auth0 ActionDispatch::Cookies::CookieOverflow
# Rails.application.config.session_store :cookie_store, key: '_pup-share_session'

# recommended: https://github.com/auth0/omniauth-auth0
Rails.application.config.session_store :cache_store
