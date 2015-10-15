class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    skip_before_filter  :verify_authenticity_token
  def after_sign_in_path_for(resource)
  	if resource.is_a?(AdminUser)
      admin_dashboard_path
    elsif resource.is_a?(User)
      if resource.sign_in_count==1
        new_profile_path
      else
       dashboard_path
      end
    end
  end
  
end
