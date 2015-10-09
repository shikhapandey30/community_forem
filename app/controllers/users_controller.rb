class UsersController < ApplicationController
	before_action :authenticate_user!
	def index
	end
	def dashboard
	end
end
