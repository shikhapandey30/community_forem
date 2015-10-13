class ForumsController < InheritedResources::Base

  private

    def forum_params
      params.require(:forum).permit(:name, :user_id,:description)
    end
end

