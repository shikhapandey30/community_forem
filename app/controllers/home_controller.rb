class HomeController < ApplicationController
  def index
    if params[:id]
      @post = Post.find(params[:id])
      Speech.new(@post.description).speak
    end
    redirect_to dashboard_path if user_signed_in?
  end

  def aboutus
  end

  def contactus
  end

  def help
  end

  def help_center
  end

  def how_it_work
  end

  def terms_and_conditions
  end

  def privacy_policy
  end
end
