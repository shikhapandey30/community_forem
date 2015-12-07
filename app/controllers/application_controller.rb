class ApplicationController < ActionController::Base
  layout 'application'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    skip_before_filter  :verify_authenticity_token
    before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
  	if resource.is_a?(Admin)
      rails_admin_path
    elsif resource.is_a?(User)
      if resource.sign_in_count==1
        new_profile_path
      else
       dashboard_path
      end
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :screen_name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :screen_name, :email, :password, :password_confirmation, :current_password) }
  end  
end
