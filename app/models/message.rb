class Message < ActiveRecord::Base
	belongs_to :conversation
	belongs_to :user
	validates_presence_of :body, :conversation_id, :user_id
	# scope :friend_chats, -> (friend) {where(conversation_id: friend.id)}
	scope :between, -> (sender_id,recipient_id) do
	  where("(user_id = ? OR conversation_id =?) AND (conversation_id = ? OR user_id =?)", sender_id,sender_id, recipient_id, recipient_id)
	end
	attr_accessor :recipient_ids

end
