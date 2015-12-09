class User < ActiveRecord::Base
  
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
  
  has_one :skill, dependent: :destroy
  # accepts_nested_attributes_for :skill, :reject_if => :all_blank, :allow_destroy => true
  
  has_one :users_category, dependent: :destroy
  # has_many :categories
  #accepts_nested_attributes_for :users_categories, :reject_if => :all_blank, :allow_destroy => true
  
  has_many :replies, dependent: :destroy

  has_many :authenticates
  
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
      self.profile.image
    else
      '../assets/images/profile.jpg'
    end
  end
end
