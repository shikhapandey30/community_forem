class UsersController < ApplicationController
	before_action :authenticate_user!,:except => [:social_login]
	def index
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
  def user_category
    if current_user.categorables_categories.present?
      cat=current_user.categorables_categories.uniq
      @all_cat=cat.collect{|f| f.name}
    end
    
    @category_ids=params[:category_ids]
    if @category_ids.present?
     @category_ids.each do |f|
      category=Categorable.create(:categorable_type=>'Category',:categorable_id=>f,:user_id=>current_user.id,:category_id=>f)
    end
  end
    @category=Category.all
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
