class Specialization < ActiveRecord::Base
	belongs_to :education_history
	belongs_to :user
end
