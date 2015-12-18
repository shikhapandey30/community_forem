class ErrorsController < ApplicationController
  def not_found
  	 render(:status => 404)
  end

  def not_found
  	 render(:status => 500)
  end

end
