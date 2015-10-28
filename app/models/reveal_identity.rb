class RevealIdentity < ActiveRecord::Base
	before_update :add_notification
	def add_notification
		if self.accept==true
			Notification.create(:notifictaion_type=>'RevealIdentity',:user_id=>self.user_id,:notification_status=>'Unread')
	    end
	end
end
