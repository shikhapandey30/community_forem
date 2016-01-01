class DislikesController < ApplicationController

	# filters
  before_action :authenticate_user!

  # creating dislike
	def create
    @dislike,@like, @model = Dislike.create_like(params[:id], params[:type], current_user, params[:body])    
  end
end
