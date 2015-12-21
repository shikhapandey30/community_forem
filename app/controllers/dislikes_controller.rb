class DislikesController < ApplicationController
  before_action :authenticate_user!
	def create
    @dislike, @model = Dislike.create_like(params[:id], params[:type], current_user)    
  end
end
