class Message < ActiveRecord::Base

	## Model Associations
	belongs_to :conversation
	belongs_to :user

	has_one :upload, as: :uploadable, dependent: :destroy
  	accepts_nested_attributes_for :upload, :allow_destroy => true
	
	## Model Validations
	validates_presence_of :body, :conversation_id, :user_id
	
	## Scopes
	# scope :friend_chats, -> (friend) {where(conversation_id: friend.id)}
	scope :between, -> (sender_id,recipient_id) do
	  where("(user_id = ? OR conversation_id =?) AND (conversation_id = ? OR user_id =?)", sender_id, sender_id, recipient_id, recipient_id)
	end
	scope :archive_messages, -> (user) {where(archive: true, by_user: user)}

	scope :incoming_messages, -> (user) { where( is_read: false, read_at: nil, conversation_id: user ) }
	scope :archive, -> (user) {update_all(archive: true, by_user: user)}

	## generating getter and setter methods
	attr_accessor :recipient_ids

end
