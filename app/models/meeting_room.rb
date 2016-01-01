class MeetingRoom < ActiveRecord::Base
 	
 	extend FriendlyId
  friendly_id :topic, :use => :slugged
  
	## Model Associations
	belongs_to :category
	belongs_to :user
	
	has_many :likes, dependent: :destroy, :as => :likable
	has_many :dislikes, dependent: :destroy, :as => :dislikable
	has_many :comments,:dependent => :destroy, :as => :commentable
	has_many :members,:dependent => :destroy, :as => :invitable
    has_many :posts,:dependent => :destroy, :as => :postable
	
	has_one :upload, as: :uploadable, dependent: :destroy
	
	accepts_nested_attributes_for :upload, :allow_destroy => true
	
    ## Model Validations
    validates_presence_of :category_id, :topic, :slogan, :name, :headline
	
	def liked?(current_user)
    # UserRace.where(:user_id => current_user.id ).first
    self.likes.where(:user_id => current_user.id,:likable_type=> "MeetingRoom" )
	end
	def disliked?(current_user)
	# UserRace.where(:user_id => current_user.id ).first
		self.dislikes.where(:user_id => current_user.id,:dislikable_type=> "MeetingRoom" )
	end

	## Meeting room image OR meeting room default image
	def img
	  if self.upload.try(:image).present?
	    self.upload.try(:image)
	  else
	    'images/meeting_room.jpg'
	  end
	end
	# start code - kandarp
	## Search meeting room by topic
  def self.search(search)
	  if search
	    where('lower(topic) LIKE ?', "%#{search}%".downcase)
	  else
	    all
	  end
	end
  	# end code - kandarp
end