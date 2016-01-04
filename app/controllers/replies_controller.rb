class RepliesController < ApplicationController

	# filters
  before_action :set_reply, only: [:update, :destroy]

	# reply creation
	def create
		@comment = Comment.find(params[:comment_id])
		params[:reply][:user_id] = current_user.id
		@reply = @comment.replies.create(reply_params) if params[:reply][:body].present?
		@replies = @comment.replies
	end

	#reply updation
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

  # reply deletion
  def destroy
    @reply.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'reply is successfully destroyed.' }
      format.json { head :no_content }
    end
  end


	private

	# setting reply for update and destroy action
	def set_reply
  	@reply = Reply.find(params[:id])
  end

  # permitting reply parameters
	def reply_params
		params.require(:reply).permit(:comment_id, :user_id, :body)
	end
end