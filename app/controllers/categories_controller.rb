class CategoriesController < ApplicationController

	# showing all categories
	def index
		@categories = Category.all
	end

	# fetching all posts for particular category
	def show
		@category = Category.friendly.find(params[:id])
		@posts = @category.posts.order("updated_at desc")
		@comment = Comment.new
	end

  private
  	# allowing the parameters for category
    def category_params
      params.require(:category).permit(:name, :user_id)
    end
end

