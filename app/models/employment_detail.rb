class EmploymentDetail < ActiveRecord::Base
	belongs_to :user
	after_save :set_experience
	# has_many :organisations
	# accepts_nested_attributes_for :organisations, :allow_destroy => true
 #    validates_presence_of :organisations

 def set_experience
 	min_date = self.user.employment_details.collect(&:start_work_date).min
 	max_date = self.user.employment_details.collect(&:worked_till).max
 	experience = (max_date.to_date - min_date.to_date).to_i
 	self.user.employment_details.update_all(total_experience: nil)
 	self.user.employment_details.last.update_column(:total_experience, experience)
 end

end
