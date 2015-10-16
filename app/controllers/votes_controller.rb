class VotesController < ApplicationController
	def create
  	@forum_poll= ForumPoll.find(params[:forum_poll_id])
  	user_vote=@forum_poll.votes.where(:user_id=>current_user.id,:votable_id=>@forum_poll.id).first
  	 if user_vote
       @user_vote_type=user_vote.vote_type
  	   @is_vote='true'
  	else
  		@vote = @forum_poll.votes.create(:user_id => current_user.id,:vote_type=>params[:value])
    end
  end
end
