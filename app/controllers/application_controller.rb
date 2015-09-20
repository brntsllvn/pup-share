class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include Knock::Authenticable # auth0 
end