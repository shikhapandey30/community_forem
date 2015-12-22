class Forum < ActiveRecord::Base
	has_many :topics, :dependent => :destroy
	belongs_to :user
	has_many :comments,:dependent => :destroy, :as => :commentable
end
