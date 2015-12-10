class HomeController < ApplicationController
  def index
    if user_signed_in? 
      redirect_to dashboard_path
      else
      redirect_to root_path
    end
  end

  def aboutus
  end

  def contactus
  end

  def help
  end
  def how_it_work
  end

  def terms_and_conditions
  end

  def privacy_policy
  end
end
