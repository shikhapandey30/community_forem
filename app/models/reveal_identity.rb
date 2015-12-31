class RevealIdentity < ActiveRecord::Base

	## Callbacks
	before_update :add_notification

	## Model Associations
	belongs_to :user
	belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'

	has_many :subscriptions,:dependent => :destroy, :as => :subscribable

	def add_notification
		if self.accept==true
		# Notification.create(:notifictaion_type=>'RevealIdentity',:user_id=>self.user_id,:notification_status=>'Unread')
	  end
	end
end
