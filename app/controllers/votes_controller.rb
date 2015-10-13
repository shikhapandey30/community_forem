class VotesController < ApplicationController
	def create
  	@forum_poll= ForumPoll.find(params[:forum_poll_id])
  	@vote = @forum_poll.votes.where(:user_id =>current_user.id).first

  	if 	@vote
  		@is_vote = true
  	else
  		@vote = @forum_poll.votes.create(:user_id => current_user.id,:vote_type=>params[:id])
  	end
  	redirect_to :back
  end
end
