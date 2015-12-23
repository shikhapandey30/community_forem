class ApplicationController < ActionController::Base
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    skip_before_filter  :verify_authenticity_token
    before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :screen_name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :screen_name, :email, :password, :password_confirmation, :current_password) }
  end

   # Mobile Devices and Format
  def mobile_device?    
    if request.env["HTTP_USER_AGENT"] && request.env["HTTP_USER_AGENT"][/(iPhone|iPad|iPod|BlackBerry|Android)/]
      return false
    # elsif request.user_agent =~ /tab/
    #   return false
    # else
    #   request.user_agent =~ /Mobile|webOS/
   else
    return true
    end
    # if request.env['HTTP_USER_AGENT'] =~ /[^\(]*[^\)]Chrome\// && request.remote_ip == "125.63.73.83"
     #return true
    # end
  end
helper_method :mobile_device?

  # def keyword_filter(name,keyword)    
  #   @peoples = User.search(params[:name])
  #   @groups = Group.search(params[:name]).collect(&:members).compact.flatten
  #   @communities = Community.search(params[:name]).collect(&:members).compact.flatten
  #   case keyword
  #   when "People"
  #     return @peoples
  #   when "Communities"
  #     return @groups      
  #   when "Groups"
  #     return @communities
  #   else
  #     return @peoples, @groups, @communities
  #   end
  # end
end
