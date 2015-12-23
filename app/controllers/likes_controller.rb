class LikesController < ApplicationController
	def create    
    @like,@dislike, @model = Like.create_like(params[:id], params[:type], current_user)        
  end
end
