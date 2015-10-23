class AuthController < ApplicationController
  skip_before_action :authenticate_user!

  def callback    
    # Stores user information from the provider
    session[:userinfo] = request.env['omniauth.auth']

    # find or create
    User.find_or_create_by_hash(session[:userinfo])
    
    # Redirect after successful auth
    redirect_to user_upcoming_walks_path(current_user), notice: 'hi there'
  end

  def failure
    redirect_to '/', alert: request.params['message']
  end

  def destroy
    reset_session
    redirect_to '/', notice: 'bye'
  end  
end