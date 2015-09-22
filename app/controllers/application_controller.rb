class ApplicationController < ActionController::Base  
  # Prevent CSRF attacks by raising an exception
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    # return session[:userinfo][:uid] if session[:userinfo]
    return User.where(uid: session[:userinfo][:uid]).first if session[:userinfo]
    "Guest"
  end

  private

  def authenticate_user!
    unless current_user != "Guest"
      redirect_to root_path, notice: "Sign in, please"
    end
  end

end