module NotificationsHelper

	def notification_html(reciver_id)
		@current_user = User.find(reciver_id)
		notifications = @current_user.notifications.unread 
        messages = @current_user.notifications.messages.unread 
        friend_requests = @current_user.notifications.friend_requests.unread 
        notifications = notifications - messages - friend_requests

		"<span> #{@current_user.screen_name} dsdsdsdd </span>		
		
		"
	end
end
