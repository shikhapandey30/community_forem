class Message < ActiveRecord::Base

	## Model Associations
	belongs_to :conversation
	belongs_to :user
	
	## Model Validations
	validates_presence_of :body, :conversation_id, :user_id
	
	## Scopes
	# scope :friend_chats, -> (friend) {where(conversation_id: friend.id)}
	scope :between, -> (sender_id,recipient_id) do
	  where("(user_id = ? OR conversation_id =?) AND (conversation_id = ? OR user_id =?)", sender_id,sender_id, recipient_id, recipient_id)
	end

	## getter and setter methods
	attr_accessor :recipient_ids

end
