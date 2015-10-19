class Topic < ActiveRecord::Base
	 belongs_to :forum
	 has_many :forum_polls
     has_many :posts
     belongs_to :user
     has_many :likes, :as => :likable
     mount_uploader :file, TopicUploader
     has_many :attachments,:dependent => :destroy, :as => :attachable
     validates :name, uniqueness: true, :allow_blank => true
end
