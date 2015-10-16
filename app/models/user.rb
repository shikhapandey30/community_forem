class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_one :profile 
  has_one :education_history
  has_one :employment_detail
  has_one :specialization,through: :education_history
  has_one :user_skill
  has_many :organisations , through: :employment_detail
  has_many :institutes , through: :education_history
  has_many :courses, through: :education_history
  has_many :authenticates
  has_many :posts
  has_many :forums
  has_many :forum_polls
  has_many :skills,through: :user_skill

  accepts_nested_attributes_for :skills, :allow_destroy => true
  has_many :categorables, dependent: :destroy
  #has_many :categorables_categories, through: :categorables, source: :categorable, source_type: 'Category'
  has_many :categories, through: :categorables
end
