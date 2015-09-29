class AuthController < ApplicationController
  skip_before_action :authenticate_user!

  def callback
    # Stores user information from the provider
    session[:userinfo] = request.env['omniauth.auth']

    # create user if one does not exist
    User.find_or_create_by_hash(session[:userinfo])
    
    # Redirect after successfull auth
    redirect_to '/', notice: "hi there"
  end

  def failure
    # show a failure page or redirect to an error page
    @error_msg = request.params['message']
  end

  def destroy
    reset_session
    redirect_to '/', notice: "bye"
  end  
end