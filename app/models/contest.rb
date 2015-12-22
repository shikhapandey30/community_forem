class Contest < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
	# validates_presence_of :topic_id
	validates_presence_of :category_id
	has_one :upload, as: :uploadable, dependent: :destroy
  	accepts_nested_attributes_for :upload, :allow_destroy => true
end