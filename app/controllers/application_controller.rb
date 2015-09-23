class ApplicationController < ActionController::Base  
  # Prevent CSRF attacks by raising an exception
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :user_signed_in?
  
  def current_user
    return User.where(uid: session[:userinfo][:uid]).first if session[:userinfo]
    'Guest'
  end
  
  def user_signed_in?
    return current_user != 'Guest' ? true : false
  end

  private

  def authenticate_user!
    unless current_user != "Guest"
      redirect_to root_path, notice: "Sign in, please"
    end
  end

end