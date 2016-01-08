class UsersController < ApplicationController

  ## filters
	before_action :authenticate_user!,:except => [:social_login]

  ## all topics and users
  def index
    @topic=Topic.all
    @users=User.all
	end

  ## searching for people, communitites and groups
  def search
    case params[:keyword]
    when "People"
      @peoples = User.search(params[:name])
    when "Communities"
      @communities = Community.search(params[:name])
    when "Groups"
      @groups = Group.search(params[:name])
    else
      @peoples = User.search(params[:name])
      @groups = Group.search(params[:name])
      @communities = Community.search(params[:name])
    end    
    respond_to do |format|      
      format.js
      format.html
    end
    # @peoples, @groups, @communities = keyword_filter(params[:name], params[:keyword])
    # render edit_profile_path(@user)
    # redirect_to profile_path(@user)
  end
  
  def reveal_identity    
  end

  ## Marked notifications as read for the user 
  def notification_count
    current_user.notifications.update_all(:notification_status=>'Read')
  end


	## user dashboard
  def dashboard
    # ProjectCleanupWorker.perform_in(2.minutes, current_user.id)
    @suggested_communities = new_suggested_communities.paginate(:page => params[:page], :per_page => 2)
    @suggested_connections = new_suggested_connections.paginate(:page => params[:page], :per_page => 2)
    @suggested_groups = new_suggested_groups.paginate(:page => params[:page], :per_page => 2)
    @suggested_meeting_rooms = new_suggested_meeting_rooms.paginate(:page => params[:page], :per_page => 2)
    @suggested_contests = new_suggested_contests.paginate(:page => params[:page], :per_page => 2)
    # @user_notification=current_user.notifications.where(:notification_status=>'Unread')
    # @reveal_identity=@user_notification.where(:notifictaion_type=>'RevealIdentity')
    # @follow=@user_notification.where(:notifictaion_type=>'Follow Request')
    # @users_json = User.all.map{|u| {:value=> u.id,:label=>u.email}}
    #  posts = Post.all
    # pub_post=posts.where("visibility =? AND user_id != ?", 'Public', current_user.id)
    # self_post=current_user.posts
    # @posts=pub_post+self_post

    if params[:data]=="hot_topic"
      @posts = EmploymentDetail.select{|e| e.total_experience}.sort_by(&:total_experience).reverse.
                  collect(&:user).flatten.map{|u| u.posts.validity}.compact.flatten rescue []
    else     
      @posts = Post.all.validity
    end
    self_post=current_user.posts
    @posts= (@posts  + self_post).compact.sort_by(&:updated_at).reverse

    @posts = @posts.uniq.paginate(:page => params[:page], :per_page => 8)
    @comment = Comment.new
    respond_to do |format|
      format.html { render 'dashboard'}
      format.js { render 'dashboard'}
    end
	end


  ## creating followers and notification
  def follow
    @following = Following.where(followable_id: params[:followable_id], followable_type: params[:followable_type], follower_id: params[:follower_id]).first
    if @following.nil?
      @following = Following.create(followable_id: params[:followable_id], followable_type: params[:followable_type], follower_id: params[:follower_id])
      # Notification.create(:notifictaion_type=>'Follow',:user_id=>params[:follower_id],:notification_status=>'Unread')
      Notification.create(recepient_id: params[:followable_id] , user: current_user, body: "#{current_user.screen_name } has follow to you", notificable: @following, :accept => false)
    else
      @unfollow = @following.destroy
    end
  end
 
  ## Fetching all groups, posts, communities, forum polls, meeting rooms, contests followed by user on basis of search parameter passed otherwise all
  def followings
    @followings = current_user.followings
    if params[:name].present? 
      @suggested_groups = current_user.followings_groups.search(params[:name])
    else
      @suggested_groups = current_user.followings_groups
    end
    if params[:name].present?
      @post_followings = current_user.followings_posts.search(params[:name])
    else
      @post_followings = current_user.followings_posts
    end
    if params[:name].present?
      @suggested_communities = current_user.followings_communities.search(params[:name])
    else
      @suggested_communities = current_user.followings_communities
    end
    if params[:name].present?
      @suggested_meeting_rooms = current_user.followings_meeting_rooms.search(params[:name])
    else
      @suggested_meeting_rooms = current_user.followings_meeting_rooms
    end
    if params[:name].present?
      @suggested_contests = current_user.followings_contests.search(params[:name])
    else
      @suggested_contests = current_user.followings_contests
    end
    if params[:name].present?
      @suggested_forum_polls = current_user.followings_forum_polls.search(params[:name])
    else
      @suggested_forum_polls = current_user.followings_forum_polls
    end
    

    respond_to do |format|
      format.js
      format.html
    end
  end
 
 ## finding followers
  def followers    
    @followers = current_user.followers  
    respond_to do |format|
      format.js
      format.html
    end
  end
  
  ## finding user associated categories
  def user_category
    @category=Category.all
    if current_user.categories.present?
      cat=current_user.categories.uniq
      @all_cat=cat.collect{|f| f.name}
    end
    
    @category_ids=params[:category_ids]
    if @category_ids.present?
      current_user.categorables.delete_all
      @category_ids.each do |f|
        category=Categorable.create(:categorable_type=>'Category',:categorable_id=>f,:user_id=>current_user.id,:category_id=>f)
      end
      redirect_to dashboard_path, notice: 'Categories Added successfully'
    end
  end

  ## suggested connection filter by name
  def connection_filter
    @suggested_connections = User.where(id: new_suggested_connections).by_name(params[:name])
    @suggest = false
  end

	def social_login
		user = Authenticate.from_omniauth(env["omniauth.auth"])
    if user
      # flash[:notice] = "Authentication successful."
     if user.confirmed_at==nil
     	user.confirmed_at=Time.now
     end
     sign_in :user, user
     if  user.profile.present?
      redirect_to dashboard_path
     else
      redirect_to dashboard_path
     end
    else
        flash[:notice] = "Authentication Failed."
        redirect_to root_path
    end
  end


  ## creating and sending user revealing request
  def reveal_request     
    @reveal_identity=RevealIdentity.create(:sender_id=>current_user.id,:user_id=>params[:id], :body=>params[:body1], :body2 => params[:body2], :accept => false)
    Notification.create(recepient_id: params[:id].to_i, user: current_user, body: "#{current_user.screen_name } wants to reveal your identity", notificable: @reveal_identity, :accept => false)
    NotificationMailer.reveal_request(@reveal_identity).deliver_later       
    @status=true
    flash[:success] = "Request sent"
    redirect_to :back
  end


  def payment
  end

  ## suggested communities for user
  def suggested_communities
    @suggested_communities = new_suggested_communities
  end

  ## suggested connections for user
  def suggested_connections    
    @suggested_connections = new_suggested_connections
  end

  ## suggested groups for user
  def suggested_groups    
    @suggested_groups = new_suggested_groups
  end
end