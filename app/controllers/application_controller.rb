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

  def new_suggested_communities    
    @communities = current_user.friends.collect(&:communities).compact.flatten.uniq.sort_by {|c| c.updated_at}.reverse
    @join_communities = current_user.members.where(invitable_type: "Community").collect(&:invitable).uniq
    return (@communities.to_a)
  end

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
