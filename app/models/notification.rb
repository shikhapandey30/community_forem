class Notification < ActiveRecord::Base
	 belongs_to :recepient, class_name: "User"
     belongs_to :user, class_name: "User"
	 belongs_to :notificable, :polymorphic => true
	 scope :unread, ->{ where(accept: false) }
	 scope :read, ->{ where(accept: true) }
	 scope :messages, ->{ where(notificable_type: 'Message') }
	 scope :friend_requests, ->{ where(notificable_type: 'Friendship') }
	attr_accessor :sender_id
end
