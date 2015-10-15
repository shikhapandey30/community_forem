class EducationHistory < ActiveRecord::Base
	has_many :courses
	has_many :institutes
	belongs_to :specialization
	accepts_nested_attributes_for :courses, :allow_destroy => true
	accepts_nested_attributes_for :institutes, :allow_destroy => true
    validates_presence_of :courses
    validates_presence_of :institutes
    validates_presence_of :specialization_id
end
