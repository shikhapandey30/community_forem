class Member < ActiveRecord::Base

  ## Model Associations
  belongs_to :user
  belongs_to :invitable, polymorphic: true
  scope :isMe?, -> user { where(user_id: user) }
  
end
