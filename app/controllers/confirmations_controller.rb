class ConfirmationsController < Devise::ConfirmationsController

  private

  def after_confirmation_path_for(resource_name, resource)
    flash[:notice] = 'Email address confirmed. Thanks'
    sign_in(resource_name, resource)
    root_path
  end  

end
