class EmploymentDetail < ActiveRecord::Base
	belongs_to :user
	has_many :organisations
	accepts_nested_attributes_for :organisations, :allow_destroy => true
end
