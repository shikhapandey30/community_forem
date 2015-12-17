class MeetingRoom < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
	validates_presence_of :category_id
	has_one :upload, as: :uploadable, dependent: :destroy
	has_many :likes, :as => :likable
	has_many :comments,:dependent => :destroy, :as => :commentable
	accepts_nested_attributes_for :upload, :allow_destroy => true
end