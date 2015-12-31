class Post < ActiveRecord::Base
  #  include PublicActivity::Model
  # tracked
   # extend FriendlyId
  # friendly_id :title, :use => :slugged
  # validates :title, uniqueness: true, :allow_blank => true

  ## Model Validations
  validates_presence_of :topic, :category_id, :description, :title
	
  ## Model Associations
  belongs_to :category
	belongs_to :user
	 # has_one :topic
  belongs_to :postable, :polymorphic => true
	has_many :likes, :as => :likable, dependent: :destroy
  has_many :dislikes, :as => :dislikable, dependent: :destroy
	has_many :comments,:dependent => :destroy, :as => :commentable
  has_many :followings, as: :followable, :dependent => :destroy
  has_one :upload, as: :uploadable, dependent: :destroy
  # has_many :attachments,:dependent => :destroy, :as => :attachable

  accepts_nested_attributes_for :upload, :allow_destroy => true

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

  ## search by post topic
  def self.search(search)
    if search
      where('topic LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
