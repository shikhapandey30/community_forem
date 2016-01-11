class Course < ActiveRecord::Base

	## Model Associations
	has_many :education_histories

	## Model validations
	validates_uniqueness_of :name
end
