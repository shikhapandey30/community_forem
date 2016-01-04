class Topic < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => [:slugged, :finders]

  ## Model Associations
  belongs_to :forum
  belongs_to :user

  has_many :likes, :as => :likable
  has_many :attachments,:dependent => :destroy, :as => :attachable
  # has_many :forum_polls
  # has_many :posts
  
  mount_uploader :file, TopicUploader
  
  ## Model Validations
  validates :name, uniqueness: true, :allow_blank => true
end
