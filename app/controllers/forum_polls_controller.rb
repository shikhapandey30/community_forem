class ForumPollsController < InheritedResources::Base
  before_action :set_forum_poll, only: [:show, :edit, :update, :destroy]
  
  def show
  	votes=@forum_poll.votes
  	user_vote=votes.where(:user_id=>current_user.id,:votable_id=>@forum_poll.id).first
  	 if user_vote
       @user_vote_type=user_vote.vote_type
  	 end
  end

  private
    def set_forum_poll
      @forum_poll= ForumPoll.find(params[:id])
    end
    def forum_poll_params
      params.require(:forum_poll).permit(:category_id, :topic_id, :body, :visibility, :start_date, :end_date)
    end
end

