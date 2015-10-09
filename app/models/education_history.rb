class EducationHistory < ActiveRecord::Base
	has_many :courses
	has_one :specialization
	has_many :institutes
	accepts_nested_attributes_for :courses, :allow_destroy => true
	accepts_nested_attributes_for :institutes, :allow_destroy => true
end
