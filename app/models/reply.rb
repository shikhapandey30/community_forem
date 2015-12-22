class Reply < ActiveRecord::Base
	has_many :likes, :as => :likable, dependent: :destroy
	has_many :dislikes, :as => :dislikable, dependent: :destroy
	belongs_to :comment
	belongs_to :user
end
