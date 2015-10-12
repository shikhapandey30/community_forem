class LikesController < ApplicationController
	def create
  	@post = Post.find(params[:post_id])
  	@like = @post.likes.where(:user_id =>current_user.id).first

  	if @like
  		@like.destroy
  		@is_like = false
  	else
  		@like = @post.likes.create(:user_id => current_user.id)
  		@is_like = true
  	end
  end
end
