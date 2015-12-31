class CreditCardDetail < ActiveRecord::Base

	## Model Associations
	belongs_to :subscription
end
