class UsersController < ApplicationController
	before_action :authenticate_user!,:except => [:social_login]
	def index
    @topic=Topic.all
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

	def dashboard
     posts = Post.all
    pub_post=posts.where("visibility =? AND user_id != ?", 'Public', current_user.id)
    self_post=current_user.posts
    @posts=pub_post+self_post
	end
  def follow
    @following = Following.where(:following_id => current_user.id, :follower_id => params[:follower_id]).first

    if @following.nil?
     @following = Following.create(:following_id => current_user.id, :follower_id => params[:follower_id])
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
