class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  def index
    @comments = current_user.comments
  end

  def create
    # if params[:forum_id].present?
    #   @forum = Forum.find(params[:forum_id])
    #   @comment = @forum.comments.create(comment_params)
    # else
  	  @post = Post.find(params[:post_id])
      params[:comment][:user_id] = current_user.id
      @comment = @post.comments.create(comment_params)
    #end
    @comments = @post.comments
    respond_to do |format|
    if @comment.save
      format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
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
	      format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
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
      format.html { redirect_to :back, notice: 'Comment was successfully destroyed.' }
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

