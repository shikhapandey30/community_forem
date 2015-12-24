class ApplicationController < ActionController::Base
  helper_method :mobile_device?  
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
    @joined_communities = current_user.members.where(invitable_type: "Community").collect(&:invitable).uniq
    return (@communities.to_a - @joined_communities)
  end

  def new_suggested_connections
    @frends_of_friend = current_user.friends.collect(&:my_friends).compact.flatten.uniq
    @friend = current_user.friendships.collect(&:friend).flatten.uniq    
    return @frends_of_friend.to_a - @friend.to_a
  end

  def new_suggested_groups    
    @groups = current_user.friends.collect(&:groups).compact.flatten.uniq.sort_by {|c| c.updated_at}.reverse
    @joined_groups = current_user.members.where(invitable_type: "Group").collect(&:invitable).uniq
    return (@groups.to_a )
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
