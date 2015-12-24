class Contest < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
    has_many :posts,:dependent => :destroy, :as => :postable
    has_many :members,:dependent => :destroy, :as => :invitable
    has_many :likes, :as => :likable, dependent: :destroy
    has_many :dislikes, :as => :dislikable, dependent: :destroy
	has_many :comments,:dependent => :destroy, :as => :commentable
    has_many :followings, as: :followable, :dependent => :destroy
	# validates_presence_of :topic_id
	validates_presence_of :category_id, :start_date, :end_date
	has_one :upload, as: :uploadable, dependent: :destroy
	accepts_nested_attributes_for :upload, :allow_destroy => true
	def img
	  if self.upload.try(:image).present?
	    self.upload.try(:image)
	  else
	    'images/contests.png'
	  end
	end
end