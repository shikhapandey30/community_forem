class Institute < ActiveRecord::Base

	## Model Associations
	has_many :education_histories
	
end
