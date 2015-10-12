class UsersController < ApplicationController
	before_action :authenticate_user!,:except => [:social_login]
	def index
	end
	def dashboard
	 posts = Post.all
    pub_post=posts.where("visibility =? AND user_id != ?", 'Public', current_user.id)
    self_post=current_user.posts
    @posts=pub_post+self_post
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
        redirect_to new_profile_pathCategory
       end

      else
          flash[:notice] = "Authentication Failed."
      end
    end

end
