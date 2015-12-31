class Forum < ActiveRecord::Base

	## Model Associations
	belongs_to :user

	has_many :topics, :dependent => :destroy
	has_many :comments,:dependent => :destroy, :as => :commentable

end
