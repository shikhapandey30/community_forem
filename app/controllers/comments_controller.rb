class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  def index
    @comments = current_user.comments
  end

  def create
    if params[:post_id].present?
  	  @object = Post.find(params[:post_id])       
    elsif params[:meeting_room_id].present?
      @object = MeetingRoom.find(params[:meeting_room_id])       
    elsif params[:contest_id].present?
       @object = Contest.find(params[:contest_id])
    elsif params[:comunity_id].present?
       @object = Comunity.find(params[:community_id])
    end

     @comment = @object.comments.create(comment_params)
     @comments = @object.comments
       params[:comment][:user_id] = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment is successfully created.' }
          # format.json { render :show, status: :created, location: @comment }
        format.js
      end
    end
  end

  def edit
  end

  def show
  end

  def update
	  respond_to do |format|
	    if @comment.update(comment_params)
	      format.html { redirect_to @comment, notice: 'Comment is successfully updated.' }
	      format.js { render :update, status: :ok, location: @comment}
	     # format.json { render :show, status: :ok, location: @comment }
	    else
	      format.html { render :edit }
	     format.json { render json: @comment.errors, status: :unprocessable_entity }
	    end
	  end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Comment is successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
 	private
    # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :title, :body)
  end
end

