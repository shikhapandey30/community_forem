class LikesController < ApplicationController
	def create
    if params[:topic_id].present?
      @topic = Topic.find(params[:topic_id])
      @like = @topic.likes.where(:user_id =>current_user.id).first
    elsif params[:comment_id].present?
         @comment = Comment.find(params[:comment_id])
         @like = @comment.likes.where(:user_id =>current_user.id).first
     elsif params[:reply_id].present?
         @reply = Reply.find(params[:reply_id])
         @like = @reply.likes.where(:user_id =>current_user.id).first     
    elsif params[:post_id].present?
     	@post = Post.find(params[:post_id])
  	  @like = @post.likes.where(:user_id =>current_user.id).first
    elsif params[:meeting_room_id].present?
      @meeting_room = MeetingRoom.find(params[:meeting_room_id])
      @like = @meeting_room.likes.where(:user_id =>current_user.id).first
     end
  	if @like
  		@like.destroy
  		@is_like = false
  	else
      if @topic
  		@like = @topic.likes.create(:user_id => current_user.id)
  		elsif @comment
        @like = @comment.likes.create(:user_id => current_user.id)
      elsif @reply
        @like = @reply.likes.create(:user_id => current_user.id) 
      elsif @post
        @like = @post.likes.create(:user_id => current_user.id)
      elsif @meeting_room
        @like = @meeting_room.likes.create(:user_id => current_user.id)  
      end
      @is_like = true
  	end
  end
end
