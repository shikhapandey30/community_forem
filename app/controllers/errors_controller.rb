class ErrorsController < ApplicationController
  def not_found
  	 # render(:status => 404)
  end

  def internal_server_error
	  # format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => 500 }
  end

end
