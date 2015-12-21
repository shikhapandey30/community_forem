class UsersController < ApplicationController
	before_action :authenticate_user!,:except => [:social_login]
  def index
    @topic=Topic.all
    @users=User.all
	end

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
     @reveal_identity=RevealIdentity.where(:sender_id=>current_user.id,:user_id=>params[:user_id])
    if @reveal_identity.present?
      @status=false
    else
       @reveal_identity=RevealIdentity.create(:sender_id=>current_user.id,:user_id=>params[:user_id],:body=>params[:message])
       @status=true
    end
  end

  def notification_count
    current_user.notifications.update_all(:notification_status=>'Read')
  end

	def dashboard
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
                  collect(&:user).flatten.map{|u| u.posts.validity.order("updated_at desc")}.compact.flatten rescue []
    else     
      @posts = Post.all.validity.order("updated_at desc").paginate(:page => params[:page], :per_page => 15)
    end
    @comment = Comment.new
	end

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
 
  def followings    
    @followings = current_user.followings
    respond_to do |format|
      format.js
      format.html
    end
  end
 
  def followers    
    @followers = current_user.followers  
    respond_to do |format|
      format.js
      format.html
    end
  end
  
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

	def social_login
		user = Authenticate.from_omniauth(env["omniauth.auth"])
    if user
      flash[:notice] = "Authentication successful."
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
    end
  end


  def payment
  end

end