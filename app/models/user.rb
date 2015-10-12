class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_one :profile 
  has_one :education_history
  has_one :employment_detail
  has_one :specialization
  has_many :organisations , through: :employment_detail
  has_many :institutes , through: :education_history
  has_many :authenticates
  has_many :posts

  has_many :categorables, dependent: :destroy
  has_many :categorables_categories, through: :categorables, source: :categorable, source_type: 'Category'
  
end
