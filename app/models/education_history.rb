class EducationHistory < ActiveRecord::Base
	belongs_to :course
	belongs_to :institute
	belongs_to :specialization
	belongs_to :user
	# accepts_nested_attributes_for :courses, :allow_destroy => true
	# accepts_nested_attributes_for :institutes, :allow_destroy => true
  #    validates_presence_of :courses
  #    validates_presence_of :institutes
  #    validates_presence_of :specialization_id
end
