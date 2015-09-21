class AuthController < ApplicationController
  def callback
    # This stores all the user information that came from the provider
    session[:userinfo] = request.env['omniauth.auth']

    # when auth is complete try to find user with provider-uid and if does not exist then create it
    user = User.where(provider: session[:userinfo][:provider], uid: session[:userinfo][:uid]).first
    user ||= create_user_from_auth_hash(session[:userinfo])

    # Redirect to the URL you want after successfull auth
    redirect_to '/'
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