class CategoriesController < ApplicationController
	def index
		@categories = Category.all
	end

	def show
		@category = Category.find(params[:id])
		@posts = @category.posts
		@comment = Comment.new
	end

  private

    def category_params
      params.require(:category).permit(:name, :user_id)
    end
end

