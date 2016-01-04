class ForumPoll < ActiveRecord::Base
	
	extend FriendlyId
  friendly_id :topic, :use => [:slugged, :finders]

	## Model Associations
	belongs_to :category
	belongs_to :user
	# belongs_to :topic
    has_many :members,:dependent => :destroy, :as => :invitable
	# has_many :votes, :as => :votable
	has_many :votes, as: :votable, dependent: :destroy
	
	has_one :upload, as: :uploadable, dependent: :destroy
	
	accepts_nested_attributes_for :upload, :allow_destroy => true
	
	## Model Validations
	# validates_presence_of :topic_id
	validates_presence_of :category_id, :topic, :headline
	validates_uniqueness_of :topic
	
  ## Forum poll image OR default forum poll image
  def img
	  if self.upload.try(:image).present?
	    self.upload.try(:image)
	  else
	    'images/fp2.jpg'
	  end
	end
  
  ## Search by forum poll topic
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
