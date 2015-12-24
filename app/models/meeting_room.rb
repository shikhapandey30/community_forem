class MeetingRoom < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
	validates_presence_of :category_id
	has_one :upload, as: :uploadable, dependent: :destroy
	has_many :likes, :as => :likable
	has_many :dislikes, :as => :dislikable
	has_many :comments,:dependent => :destroy, :as => :commentable
	accepts_nested_attributes_for :upload, :allow_destroy => true
	has_many :members,:dependent => :destroy, :as => :invitable


	def liked?(current_user)
    # UserRace.where(:user_id => current_user.id ).first
    self.likes.where(:user_id => current_user.id,:likable_type=> "MeetingRoom" )
	end
	def disliked?(current_user)
	# UserRace.where(:user_id => current_user.id ).first
	self.dislikes.where(:user_id => current_user.id,:dislikable_type=> "MeetingRoom" )
	end

	def img
	  if self.upload.try(:image).present?
	    self.upload.try(:image)
	  else
	    'images/meeting_room.jpg'
	  end
	end
end