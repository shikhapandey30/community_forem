class VotesController < ApplicationController
  before_action :get_model
	def favour    
    if current_user.votes.my_vote(params[:id], params[:model]).present?
      current_user.votes.my_vote(params[:id], params[:model]).update(vote_in_favour: params[:favour])
    else
      @model.votes.create(user_id: current_user.id, vote_in_favour: params[:favour])
    end
    @users = @model.votes.collect(&:user).uniq
  end

  private

  def get_model
    @model = params[:model].classify.constantize.find(params[:id])
  end
  
end
