class AuthController < ApplicationController
	def failure
		flash[:alert]= "Authentication failure"
		redirect_to '/'
	end
end
