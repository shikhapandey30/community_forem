class VotesController < ApplicationController
  before_action :get_model
	def favour
    if current_user.votes.my_vote(@model).present?
      current_user.votes.my_vote(@model).update(status: params[:vote])
    else
      @model.votes.create(user_id: current_user.id, status: params[:vote])
    end
    @users = @model.votes.collect(&:user).uniq
  end

  private

  def get_model    
    @model = params[:model].classify.constantize.find(params[:id])
  end
  
end
