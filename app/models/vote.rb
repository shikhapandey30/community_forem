class Vote < ActiveRecord::Base
	belongs_to :votable, :polymorphic => true
	belongs_to :user	
	scope :favour, -> {where(vote_in_favour: true)}
	scope :against, -> {where(vote_in_favour: false)}

	def self.my_vote(model)
		where(votable: model).first
	end
end
