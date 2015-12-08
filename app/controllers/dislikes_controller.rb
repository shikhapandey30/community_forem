class DislikesController < ApplicationController
	def create
    if params[:topic_id].present?
      @topic = Topic.find(params[:topic_id])
      @dislike = @topic.dislikes.where(:user_id =>current_user.id).first

    else
     	@post = Post.find(params[:post_id])
  	  @dislike = @post.dislikes.where(:user_id =>current_user.id).first
     end
  	if @dislike
  		@dislike.destroy
  		@is_dislike = false
  	else
      if @topic
  		@dislike = @topic.dislikes.create(:user_id => current_user.id)
  		else
      @dislike = @post.dislikes.create(:user_id => current_user.id)

      end
      @is_dislike = true
  	end
  end
end
