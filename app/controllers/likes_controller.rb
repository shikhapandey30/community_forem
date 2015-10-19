class LikesController < ApplicationController
	def create
    if params[:topic_id].present?
      @topic = Topic.find(params[:topic_id])
      @like = @topic.likes.where(:user_id =>current_user.id).first

    else
     	@post = Post.find(params[:post_id])
  	  @like = @post.likes.where(:user_id =>current_user.id).first
     end
  	if @like
  		@like.destroy
  		@is_like = false
  	else
      if @topic
  		@like = @topic.likes.create(:user_id => current_user.id)
  		else
      @like = @post.likes.create(:user_id => current_user.id)

      end
      @is_like = true
  	end
  end
end
