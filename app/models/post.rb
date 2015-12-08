class Post < ActiveRecord::Base
  #  include PublicActivity::Model
  # tracked
   # extend FriendlyId
  # friendly_id :title, :use => :slugged
  validates :title, uniqueness: true, :allow_blank => true
	belongs_to :category
	# validates_presence_of :description
	belongs_to :user
	 # has_one :topic
	has_many :likes, :as => :likable
  has_many :dislikes, :as => :dislikable
	has_many :comments,:dependent => :destroy, :as => :commentable
    mount_uploader :file, PostUploader
    mount_uploader :image, PostUploader
    mount_uploader :video, PostUploader
     def liked?(current_user)
    # UserRace.where(:user_id => current_user.id ).first
    self.likes.where(:user_id => current_user.id,:likable_type=> "Post" )
  end
  def disliked?(current_user)
    # UserRace.where(:user_id => current_user.id ).first
    self.dislikes.where(:user_id => current_user.id,:dislikable_type=> "Post" )
  end
    # has_many :attachments,:dependent => :destroy, :as => :attachable
end
