class Categorable < ActiveRecord::Base

	## Model Associations
	belongs_to :categorable, polymorphic: true
	belongs_to :category
	belongs_to :user
end
