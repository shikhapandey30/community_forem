class UsersController < ApplicationController
	before_action :authenticate_user!,:except => [:social_login]
  def index
    @topic=Topic.all
    @users=User.all
	end
  def search
    @users= User.where(:id=>params[:id]).first
  end
  # def search_data
  #   if params[:type]=='User'
  #     @user
  #   else
  #     @post
  #   end
  # end
  
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
    @post = Post.all.order("created_at DESC") 
	end
  def follow
    @following = Following.where(:following_id => current_user.id, :follower_id => params[:follower_id]).first

    if @following.nil?
     @following = Following.create(:following_id => current_user.id, :follower_id => params[:follower_id])
     Notification.create(:notifictaion_type=>'Follow',:user_id=>params[:follower_id],:notification_status=>'Unread')
    else
      @unfollow = @following.destroy
    end

  end
 def followings
    @following=current_user.followings
  end
  def followers

    @follower=current_user.followers
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
        redirect_to new_profile_path
       end

      else
          flash[:notice] = "Authentication Failed."
      end
    end

end
