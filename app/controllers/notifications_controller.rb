class NotificationsController < ApplicationController

  # filter 
  before_action :authenticate_user!

	def create
		# @notification=Notification.create(:user_id=>params[:user_id],:notifictaion_type=>params[:type],:notification_status=>'Unread',:sender_id=>current_user.id)
	 #    @sender=@notifictaion.sender_id
	 #   render json: nil, status: :ok
	end

  # unread notification
  def index
  	@notifications = Notification.where(recepient: current_user).unread
  end

  # marking notification as read
  def mark_as_read
    @notifications = Notification.where(recepient: current_user).unread
    @notifications.update_all(accept:true)
    flash[:notice] = "Your all notifications has been marked as read."
    redirect_to '/dashboard'
  end

  # mark read notification as read
  def accept
  	@notification = Notification.find(params[:id])
  	notificable = @notification.notificable
  	member = Member.where(:invitable_id => @notification.notificable_id , :user_id => current_user.id ).first
  	@notification.update_attributes(accept:true)

      if @notification.notificable.class.name =="Friendship"
          @notification.notificable.update(:accept => true)                
      end

      if @notification.notificable.class.name =="RevealIdentity"
          @notification.notificable.update(:accept => true)                
      end
  	member.update_attributes(accept:true) if member.present?
  end

  # removing members for notification
  def reject
  	@notification = Notification.find(params[:id])
  	notificable = @notification.notificable
  	member = Member.where(:invitable_id => @notification.notificable_id , :user_id => current_user.id )
  	@notification.update_attributes(accept:true)
  	member.destroy_all if member.present?
  end

  def update_notification
  end

  def update_message_notification
    Message.incoming_messages.update_all(is_read: true)
  end
end
