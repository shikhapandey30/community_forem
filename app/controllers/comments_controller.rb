class CommentsController < InheritedResources::Base
  def create
  	@post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    if @comment.save
    	redirect_to :back
    end
  end
  private

    def comment_params
      params.require(:comment).permit(:user_id, :post_id, :title, :body)
    end
end

