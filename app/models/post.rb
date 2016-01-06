class Post < ActiveRecord::Base
  #  include PublicActivity::Model
  # tracked
  extend FriendlyId
  friendly_id :title, :use => [:slugged, :finders]
	
  ## Model Associations
  belongs_to :category
	belongs_to :user
  belongs_to :postable, :polymorphic => true
  
	has_many :likes, :as => :likable, dependent: :destroy
  has_many :dislikes, :as => :dislikable, dependent: :destroy
	has_many :comments,:dependent => :destroy, :as => :commentable
  has_many :followings, as: :followable, :dependent => :destroy
  # has_many :attachments,:dependent => :destroy, :as => :attachable

  has_one :upload, as: :uploadable, dependent: :destroy
  # has_one :topic

  accepts_nested_attributes_for :upload, :allow_destroy => true

  ## Model Validations
  validates_presence_of :topic, :category_id, :description, :title
  # validates :title, uniqueness: true, :allow_blank => true

  ## scopes
  scope :validity, -> { where("expiration_date >= ? and visibility = ?", Date.today, true) }
  # scope :visibility, ~> { where(visibility: true) }
  
  def liked?(current_user)
    # UserRace.where(:user_id => current_user.id ).first
    self.likes.where(:user_id => current_user.id,:likable_type=> "Post" )
  end

  def disliked?(current_user)
    # UserRace.where(:user_id => current_user.id ).first
    self.dislikes.where(:user_id => current_user.id,:dislikable_type=> "Post" )
  end

  def img
    if self.upload.try(:image).present?
      self.upload.try(:image).url(:thumb)
    else
      'images/profile.png'
    end
  end
  ## search by post topic
  def self.search(search)
    if search
      where('topic LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
