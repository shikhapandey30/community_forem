class ForumsController < ApplicationController
  def manage_forum
  	@forums=current_user.forums
  end
  private

    def forum_params
      params.require(:forum).permit(:name, :user_id,:description)
    end
end

