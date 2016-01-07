class Category < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, :use => [:slugged, :finders]

  ## Model Associations
	# has_many :categorable_categories,:dependent => :destroy, :as => :categorable
  belongs_to :user
  has_many :users_categories, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :forum_polls, dependent: :destroy
  has_many :meeting_rooms, dependent: :destroy
  has_many :contests, dependent: :destroy
  has_many :communities, dependent: :destroy

  mount_uploader :icon, CategoryUploader
  mount_uploader :image, CategoryUploader
  
  ## Model Validations
  validates_presence_of :name
  validates_uniqueness_of :name

  # has_many :categorables
  # has_many :users, through: :categorables
end
