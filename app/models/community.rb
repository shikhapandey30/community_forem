class Community < ActiveRecord::Base
  extend FriendlyId
  friendly_id :topic, :use => :slugged

  ## Model Associations
	belongs_to :user

  has_many :members,:dependent => :destroy, :as => :invitable
  has_many :posts,:dependent => :destroy, :as => :postable
  
  has_one :upload, as: :uploadable, dependent: :destroy
  
  accepts_nested_attributes_for :upload, :allow_destroy => true
  
  ## Model Validations
  validates_presence_of :category_id, :topic, :headline, :description

  ## Scopes
  scope :by_topic, lambda{|topic| where("lower(topic) like ?", "%#{topic}%")}
  
  ## Search by community topic
  def self.search(search)
    if search
       where('lower(topic) LIKE ?', "%#{search}%".downcase)
    else
      all
    end
  end

  ## community image or default image
  def img
    if self.upload.try(:image).present?
      self.upload.try(:image)
    else
      'images/cmn1.jpg'
    end
  end
  
end
