class RepliesController < ApplicationController
    before_action :set_reply, only: [:update, :destroy]

	def create
		@comment = Comment.find(params[:comment_id])
		params[:reply][:user_id] = current_user.id
		@reply = @comment.replies.create(reply_params) if params[:reply][:body].present?
		@replies = @comment.replies
	end

	def update
	  respond_to do |format|
	    if @reply.update(reply_params)
	      format.html { redirect_to @reply, notice: 'reply is successfully updated.' }
	      format.js { render :update, status: :ok, location: @reply}
	     # format.json { render :show, status: :ok, location: @comment }
	    else
	      format.html { render :edit }
	     format.json { render json: @comment.errors, status: :unprocessable_entity }
	    end
	  end
  end


	private
	def set_reply
      @reply = Reply.find(params[:id])
    end
	def reply_params
		params.require(:reply).permit(:comment_id, :user_id, :body)
	end
end