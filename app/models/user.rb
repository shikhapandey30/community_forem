class User < ActiveRecord::Base

  # searchable do
    # text :first_name
    # text :last_name
    # text :screen_name
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
  # end
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  scope :by_name, lambda{|name| where("lower(screen_name) like ?", "%#{name}%")}

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
  has_many :contests, dependent: :destroy
  has_many :meeting_rooms, dependent: :destroy
  has_many :followings, as: :followable, :dependent => :destroy
  has_many :followings, :foreign_key => "follower_id", :dependent => :destroy
  has_many :followers, :class_name => "Following", as: :followable
  has_many :authenticates
  

  #friendsships
  has_many :friendships
  # has_many :friends, :through => :friendships
  has_many :friends, -> { where(friendships: { accept: true}) }, through: :friendships
  # has_many :friends, -> { where(inverse_friendships: { accept: true}) }, through: :friendships
  has_many :inverse_friendships, -> { where(accept: true) }, :class_name => "Friendship", :foreign_key => "friend_id"

  has_many :inverse_friends, :through => :inverse_friendships, :source => :user


#Notifications
 has_many :sent_notifications,
   :class_name => 'Notification',
   :foreign_key => 'user_id'

  has_many :notifications,
   :class_name => 'Notification',
   :foreign_key => 'recepient_id'

  has_many :members, dependent: :destroy
  has_many :community_members, through: :members, source: :invitable, source_type: 'Community'
  has_many :group_members, through: :members, source: :invitable, source_type: 'Group'
  has_many :meeting_rooms_members, through: :members, source: :invitable, source_type: 'MeetingRoom'
  has_many :meeting_rooms, dependent: :destroy

  has_many :votes, dependent: :destroy

  has_many :conversations, :foreign_key => :sender_id
  has_one :notification_setting, dependent: :destroy
  accepts_nested_attributes_for :notification_setting, reject_if: :all_blank, :allow_destroy => true
  after_create :set_notification_setting
  has_many :reveal_identities, dependent: :destroy, :foreign_key => 'sender_id'


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
      '/images/profile.png'
    end
  end

  def self.search(search)
    if search
      where('lower(screen_name) LIKE ?', "%#{search}%".downcase)
    else
      all
    end
  end

  def is_friend(friend)
    friend=  Friendship.where(:friend_id => friend.id, :user_id => self.id,:accept=>true).first
    friend.present? ? true : false
  end

  def my_friends
    @friends = self.friends + self.inverse_friends
    @friends.delete(self)
    @friends
  end

  def is_liked(model)    
    Like.where(:likable => model ,:user_id => self.id).present?
  end

  def is_disliked(model)
    Dislike.where(:dislikable=> model ,:user_id => self.id).present?
  end

  def is_follow(model)
    Following.where(:followable=> model ,:follower_id => self.id).present?
  end

  def set_notification_setting     
      NotificationSetting.create(:user_id => self.id, new_update: true,  friend_request: true, is_new_record: true, comments_and_like: true, friends_birthday: true) unless self.notification_setting
  end

  def is_reveal_sent(user)
     reveal_identity=RevealIdentity.where(:sender_id=>self.id,:user_id=>user.id, :accept => false).first
     reveal_identity.present? ? true : false
  end

  def is_revealed(user)
     reveal_identity=RevealIdentity.where(:sender_id=>self.id,:user_id=>user.id, :accept => true).first
     reveal_identity.present? ? true : false
  end

end
