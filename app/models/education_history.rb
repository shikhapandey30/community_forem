class EducationHistory < ActiveRecord::Base

  ## Model Associations
	belongs_to :course
	belongs_to :institute
	belongs_to :specialization
	belongs_to :user

  ## Model Validations
  validate :validdate_date

  ## validation for date
  def validdate_date
    if self.start_year > self.end_year
      errors.add(:start_year, "Start date cannot be greater then end date.")
    end
  end
	# accepts_nested_attributes_for :courses, :allow_destroy => true
	# accepts_nested_attributes_for :institutes, :allow_destroy => true
  #    validates_presence_of :courses
  #    validates_presence_of :institutes
  #    validates_presence_of :specialization_id
end
