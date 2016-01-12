class Specialization < ActiveRecord::Base

	## Model Associations
	has_many :education_histories

	## Model Validations
	validates_uniqueness_of :name
end
