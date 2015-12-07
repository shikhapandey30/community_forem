class Category < ActiveRecord::Base
	# has_many :categorable_categories,:dependent => :destroy, :as => :categorable
  belongs_to :user
  has_many :users_categories, dependent: :destroy
  mount_uploader :image, CategoryUploader
  # has_many :categorables
  # has_many :users, through: :categorables
end
