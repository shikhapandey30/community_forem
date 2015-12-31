class Comment < ActiveRecord::Base

	## Model Associations
	belongs_to :user
	belongs_to :post
	belongs_to :meeting_room
	has_many :likes, :as => :likable, dependent: :destroy
	has_many :dislikes, :as => :dislikable, dependent: :destroy
  belongs_to :commentable, :polymorphic => true
  belongs_to :parent, :class_name => 'Comment', :foreign_key => :parent_id
	has_many :children, :class_name => 'Comment'
	has_many :replies, dependent: :destroy

	## Model Validations
	validates_presence_of :body

end
