class Wallet < ActiveRecord::Base
	belongs_to :walletable, :polymorphic => true
	belongs_to :user
end
