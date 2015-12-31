class Vote < ActiveRecord::Base

	## Model Associations
	belongs_to :votable, :polymorphic => true
	belongs_to :user

	## Scopes
	scope :favour, -> {where(status: "for")}
	scope :against, -> {where(status: "against")}
	scope :undecided, -> {where(status: "undecided")}

	def self.my_vote(model)
		where(votable: model).first
	end
end
