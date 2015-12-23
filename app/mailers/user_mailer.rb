class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def help_request(contact_id)
    @user = Contact.where(id: contact_id).first
    mail(to: "admin@example.com", subject: "#{@user.name} need assistance")
  end
end
