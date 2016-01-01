class UsersCategory < ActiveRecord::Base

	## Model Associations
	belongs_to :category
	belongs_to :user
end
