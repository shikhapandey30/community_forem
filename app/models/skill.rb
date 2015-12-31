class Skill < ActiveRecord::Base

	## Model Associations
	# belongs_to :user_skill
	belongs_to :user
end
