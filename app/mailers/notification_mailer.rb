class NotificationMailer < ApplicationMailer
  default from: 'notifications@example.com' 
 
  def friend_request(friendship)
  	@sender = friendship.user
  	@reciever =  friendship.friend
    mail(to: @reciever.email, subject: "New Friend request from TGS")
  end
end
