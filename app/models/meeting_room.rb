class MeetingRoom < ActiveRecord::Base
	 extend FriendlyId
     friendly_id :topic, :use => :slugged
	belongs_to :category
	belongs_to :user
	validates_presence_of :category_id, :topic, :slogan, :name, :headline
	
	has_one :upload, as: :uploadable, dependent: :destroy
	has_many :likes, :as => :likable
	has_many :dislikes, :as => :dislikable
	has_many :comments,:dependent => :destroy, :as => :commentable
	accepts_nested_attributes_for :upload, :allow_destroy => true
	has_many :members,:dependent => :destroy, :as => :invitable
    has_many :posts,:dependent => :destroy, :as => :postable
    

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
	# start code - kandarp
  	def self.search(search)
	  if search
	    where('lower(topic) LIKE ?', "%#{search}%".downcase)
	  else
	    all
	  end
	end
  	# end code - kandarp
end