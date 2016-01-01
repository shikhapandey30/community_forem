class HomeController < ApplicationController

  # finding post, speak description and redirecting to dashboard
  def index
    if params[:id]
      @post = Post.find(params[:id])
      Speech.new(@post.description).speak
    end
    redirect_to dashboard_path if user_signed_in?
  end

  # about us page
  def aboutus
  end

  #contact us page
  def contactus
  end

  # help page
  def help
  end

  # help center
  def help_center
    @contact = Contact.new
  end

  # create contact request and sending mail to admin
  def contact_help
    @contact = Contact.new(contact_params)
    if @contact.valid? and @contact.save
      UserMailer.help_request(@contact.id).deliver_later
    else
      render :template => "home/help_center"
    end
  end

  # how it works page
  def how_it_work
  end

  # terms and conditions page
  def terms_and_conditions
  end

  # privacy policy page
  def privacy_policy
  end
  
  private

  # permitting contact parameters
  def contact_params
    params.require(:contact).permit!
  end
end
