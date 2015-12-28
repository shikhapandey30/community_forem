class NotificationMailer < ApplicationMailer
  default from: 'notifications@example.com' 
 
  def friend_request(friendship)
  	@sender = friendship.user
  	@reciever =  friendship.friend
    mail(to: @reciever.email, subject: "New Friend request from TGS")
  end


   def reveal_request(reveal)
   	@reveal = reveal
  	@sender = reveal.sender
  	@reciever =  reveal.user
    mail(to: "rorflexsin@gmail.com", :bcc => ["#{@reciever.email}","amit_pareek@seologistics.com"], subject: "#{@sender.name} wants to reveal your identity.")

  end
end
