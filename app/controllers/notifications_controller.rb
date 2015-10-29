class NotificationsController < ApplicationController
	def create
		# @notification=Notification.create(:user_id=>params[:user_id],:notifictaion_type=>params[:type],:notification_status=>'Unread',:sender_id=>current_user.id)
	 #    @sender=@notifictaion.sender_id
	 #   render json: nil, status: :ok
	end
end
