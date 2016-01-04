class Contest < ActiveRecord::Base
	
	extend FriendlyId  
  friendly_id :topic, :use => [:slugged, :finders]

	## Model Associations
	belongs_to :category
	belongs_to :user

  has_many :posts,:dependent => :destroy, :as => :postable
  has_many :members,:dependent => :destroy, :as => :invitable
  has_many :likes, :as => :likable, dependent: :destroy
  has_many :dislikes, :as => :dislikable, dependent: :destroy
	has_many :comments,:dependent => :destroy, :as => :commentable
  has_many :followings, as: :followable, :dependent => :destroy
  has_many :votes, as: :votable, dependent: :destroy
  
  has_one :upload, as: :uploadable, dependent: :destroy
	
	accepts_nested_attributes_for :upload, :allow_destroy => true
	

  ## Model Validations
	# validates_presence_of :topic_id
	validates_presence_of :category_id, :start_date, :end_date, :topic, :headline, :description, :visibility

	## contest image OR contest default image
	def img
	  if self.upload.try(:image).present?
	    self.upload.try(:image)
	  else
	    'images/contests.png'
	  end
	end

	## search by contest topic
	# start code - kandarp
	def self.search(search)
	  if search
	    where('lower(topic) LIKE ?', "%#{search}%".downcase)
	  else
	    all
	  end
	end
  	# end code - kandarp
end