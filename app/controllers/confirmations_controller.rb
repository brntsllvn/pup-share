class ConfirmationsController < Devise::ConfirmationsController

  private

  def after_confirmation_path_for(resource_name, resource)
    flash[:notice] = "Email address confirmed. Edit your profile and preferences below."
    sign_in(resource_name, resource)
    edit_user_path(current_user)
  end  

end
