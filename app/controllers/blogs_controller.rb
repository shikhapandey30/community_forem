class BlogsController < InheritedResources::Base

  private

    def blog_params
      params.require(:blog).permit(:name, :description, :image, :user_id, :slug)
    end
end

