class User < ActiveRecord::Base

  searchable do
    string :first_name, :last_name, :screen_name
    # text :posts do
    #   posts.map { |post| post.title }
    # end
    # text :education_histories do
    #   education_histories.map { |education| education.course }
    #   education_histories.map { |education| education.specialization }
    #   education_histories.map { |education| education.institute }
    # end

    # text :employment_details do
    #   employment_details.map { |employment| employment.designation }
    #   employment_details.map { |employment| employment.organisation }
    #   employment_details.map { |employment| employment.description }
    # end

    # text :skill do
    #   skill.name
    # end

    # text :users_category do
    #   users_category.name
    # end
  end
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :screen_name, uniqueness: true
  validates :first_name, :last_name, :email, :screen_name, presence: true
  
  has_many :categories, dependent: :destroy
  has_many :education_histories, dependent: :destroy
  # accepts_nested22attributes_for :education_histories, :reject_if => :all_blank, :allow_destroy => true  
  has_many :employment_details, dependent: :destroy
  # accepts_nested_attributes_for :employment_details, :reject_if => :all_blank, :allow_destroy => true
  has_many :posts, dependent: :destroy
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile, :allow_destroy => true
  
  # has_many :skills, dependent: :destroy
  has_one :skill
  # accepts_nested_attributes_for :skill, :reject_if => :all_blank, :allow_destroy => true
  
  has_one :users_category, dependent: :destroy
  # has_many :categories
  #accepts_nested_attributes_for :users_categories, :reject_if => :all_blank, :allow_destroy => true
  
  has_many :replies, dependent: :destroy

  has_many :communities, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :forum_polls, dependent: :destroy

  has_many :followings, as: :followable, :dependent => :destroy
  has_many :followings, :foreign_key => "follower_id", :dependent => :destroy
  has_many :followers, :class_name => "Following", as: :followable
  has_many :authenticates
  

  #friendsships
  # has_many :friends, :through => :friendships, :conditions => "status = 'accepted'"
  # has_many :requested_friends, :through => :friendships, :source => :friend, :conditions => "status = 'requested'", :order => :created_at
  # has_many :pending_friends, :through => :friendships, :source => :friend, :conditions => "status = 'pending'", :order => :created_at
  # has_many :friendships, :dependent => :destroy

 #  has_one :employment_detail
 #  has_one :specialization,through: :education_history
 #  has_one :user_skill
 #  has_many :organisations , through: :employment_detail
 #  has_many :institutes , through: :education_history
 #  has_many :courses, through: :education_history
 #  has_many :authenticates
 #  
 #  has_many :topics
 #  has_many :forums
 #  has_many :forum_polls
 #  # has_many :skills,through: :user_skill
 # has_many :followings, :foreign_key => "following_id"
 # has_many :followers, :class_name => "Following", :foreign_key => "follower_id"
 #  # accepts_nested_attributes_for :skills, :allow_destroy => true
 #  has_many :categorables, dependent: :destroy
 # has_many :conversations, :foreign_key => :sender_id
 #  #has_many :categorables_categories, through: :categorables, source: :categorable, source_type: 'Category'
 #  has_many :categories, through: :categorables
 #  has_one :subscription
 #  has_many :notifications
   def following?(follow)
    self.followings.find_by(follower_id: follow.id).present?
  end
   def revealed?(reveal)
    RevealIdentity.where(:sender_id=>self.id,:user_id=>reveal.id).present?
  end
  def img
    if self.profile.present?
      self.profile.try(:image)
    else
      'images/profile.jpg'
    end
  end
end
