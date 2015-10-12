class Post < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
	has_many :likes, :as => :likable
	has_many :comments,:dependent => :destroy, :as => :commentable
     mount_uploader :attachment, PostUploader
end
