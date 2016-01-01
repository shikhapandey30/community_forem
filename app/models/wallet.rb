class Wallet < ActiveRecord::Base

	## Model Associations
	belongs_to :walletable, :polymorphic => true
	belongs_to :user
end