class LikesController < ApplicationController
	def create    
    @like, @model = Like.create_like(params[:id], params[:type], current_user)        
  end
end
