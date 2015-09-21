class ApplicationController < ActionController::Base  
  # Prevent CSRF attacks by raising an exception
  protect_from_forgery with: :exception

  #   #helper_method :logged_in_using_omniauth?
  helper_method :current_user

  #   private

  #   def logged_in_using_omniauth?
  #     unless session[:userinfo].present?
  #       # TODO: Redirect to page that has the login here
  #       redirect_to '/'
  #     end
  #   end

  def current_user
    return session[:userinfo][:uid] if session[:userinfo]
    "Guest"
  end

end