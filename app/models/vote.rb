class Vote < ActiveRecord::Base
	belongs_to :votable, :polymorphic => true
	belongs_to :user	
	scope :my_vote, lambda{ |id, model_type| where(votable_id: id, votable_type: model_type).first}
	scope :favour, -> {where(vote_in_favour: true)}
	scope :against, -> {where(vote_in_favour: false)}
end
