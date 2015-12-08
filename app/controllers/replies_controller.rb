class RepliesController < ApplicationController
	def create
		@comment = Comment.find(params[:comment_id])
		params[:reply][:user_id] = current_user.id
		@reply = @comment.replies.create(reply_params) if params[:reply][:body] .present?
		@replies = @comment.replies
	end

	private
		
	def reply_params
		params.require(:reply).permit(:comment_id, :user_id, :body)
	end
end