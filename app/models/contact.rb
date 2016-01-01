class Contact < ActiveRecord::Base

	## Model Validations
	validates_presence_of :name, :phone_no, :email, :body
end
