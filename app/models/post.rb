class Post < ActiveRecord::Base
  #  include PublicActivity::Model
  # tracked
   extend FriendlyId
  friendly_id :title, :use => :slugged
  validates :title, uniqueness: true, :allow_blank => true
	belongs_to :category
	validates_presence_of :post_text
	belongs_to :user
	has_one :topic
	has_many :likes, :as => :likable
	has_many :comments,:dependent => :destroy, :as => :commentable
    mount_uploader :file, PostUploader
    has_many :attachments,:dependent => :destroy, :as => :attachable
end
