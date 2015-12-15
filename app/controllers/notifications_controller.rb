class NotificationsController < ApplicationController
   before_action :authenticate_user!

	def create
		# @notification=Notification.create(:user_id=>params[:user_id],:notifictaion_type=>params[:type],:notification_status=>'Unread',:sender_id=>current_user.id)
	 #    @sender=@notifictaion.sender_id
	 #   render json: nil, status: :ok
	end

    def index
    	@notifications = Notification.where(recepient: current_user).unread
    end

    def mark_as_read
	    @notifications = Notification.where(recepient: current_user).unread
	    @notifications.update_all(accept:true)
	    flash[:notice] = "Mark As read"
	    redirect_to '/dashboard'
    end
end
