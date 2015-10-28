class Notification < ActiveRecord::Base
	belongs_to :user
	attr_accessor :sender_id
end
