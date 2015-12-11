class Topic < ActiveRecord::Base
	 extend FriendlyId
  friendly_id :name, :use => :slugged
	 belongs_to :forum
	 # has_many :forum_polls
     # has_many :posts
     belongs_to :user
     has_many :likes, :as => :likable
     mount_uploader :file, TopicUploader
     has_many :attachments,:dependent => :destroy, :as => :attachable
     validates :name, uniqueness: true, :allow_blank => true
end
