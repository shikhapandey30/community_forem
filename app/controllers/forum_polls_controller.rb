class ForumPollsController < InheritedResources::Base

  private

    def forum_poll_params
      params.require(:forum_poll).permit(:category_id, :topic_id, :body, :visibility, :start_date, :end_date)
    end
end

