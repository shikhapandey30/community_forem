class Dislike < ActiveRecord::Base
	belongs_to :dislikable, :polymorphic => true
	
end
