class Reply < ActiveRecord::Base
	has_many :likes, :as => :likable
	belongs_to :comment
	belongs_to :user
end
