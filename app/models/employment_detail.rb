class EmploymentDetail < ActiveRecord::Base

  ## Model Associations
	belongs_to :user
  # has_many :organisations
  # accepts_nested_attributes_for :organisations, :allow_destroy => true

  ## Callbacks
	after_save :set_experience

  ## Scopes
	scope :current_company, -> {where(:current_company=>true)}
	
  ## Model Validations
  #validates_presence_of :organisations
  validate :validdate_date

  ## validation for date
  def validdate_date
    if self.start_work_date.to_date > self.worked_till.to_date
      errors.add(:model_years, "Start date cannot be greater then end date.")
    end
  end
  
  ## Setting up user total experience
  def set_experience
   	min_date = self.user.employment_details.collect(&:start_work_date).min
   	max_date = self.user.employment_details.collect(&:worked_till).max
   	experience = (max_date.to_date - min_date.to_date).to_i
   	self.user.employment_details.update_all(total_experience: nil)
   	self.user.employment_details.last.update_column(:total_experience, experience)
  end

end
