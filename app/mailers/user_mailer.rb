class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def help_request(contact_id)
    @user = Contact.where(id: contact_id).first
    mail(to: "rorflexsin@gmail.com", :bcc => ["#{@user.email}","amit_pareek@seologistics.com"], subject: "#{@user.name} need assistance")
  end

  def notification(user)
  	@user = user
    mail(to: @user.email, subject: "TGS Notification")
  end
end
