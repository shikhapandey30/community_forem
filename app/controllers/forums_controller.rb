class ForumsController < ApplicationController

	# fetching all forums for user
  def manage_forum
  	@forums=current_user.forums
  end
  private

  	# permitting forum poll parameters
    def forum_params
      params.require(:forum).permit(:name, :user_id,:description)
    end
end

