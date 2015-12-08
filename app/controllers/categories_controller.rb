class CategoriesController < ApplicationController

  private

    def category_params
      params.require(:category).permit(:name, :user_id)
    end
end

