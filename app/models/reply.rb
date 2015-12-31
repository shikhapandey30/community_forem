class Reply < ActiveRecord::Base

	## Model Associations
	belongs_to :comment
	belongs_to :user

	has_many :likes, :as => :likable, dependent: :destroy
	has_many :dislikes, :as => :dislikable, dependent: :destroy
	
	## Model Validations
	validates_presence_of :body

end
