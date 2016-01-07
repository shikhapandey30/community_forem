class CategoriesController < ApplicationController

	# showing all categories
	def index
		@categories = Category.all
	end

	# fetching all posts for particular category
	def show
		@category = Category.friendly.find(params[:id])	
		@posts = (@category.posts + @category.groups + @category.meeting_rooms + @category.contests + @category.forum_polls + @category.communities).compact.flatten.sort_by{|p| p.updated_at}.reverse
		@comment = Comment.new
	end

  private
  	# allowing the parameters for category
    def category_params
      params.require(:category).permit(:name, :user_id)
    end
end

