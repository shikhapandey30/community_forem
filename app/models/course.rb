class Course < ActiveRecord::Base
	has_many :education_histories
end
