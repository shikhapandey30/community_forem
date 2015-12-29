class Subscription < ActiveRecord::Base
	belongs_to :user
    belongs_to :subscribable, :polymorphic => true
    has_one :credit_card_detail
	
end
