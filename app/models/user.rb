class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_one :profile 
  has_one :education_history
  has_one :employment_detail
  has_many :categories
  has_one :specialization
  has_many :organisations , through: :education_history
    has_many :institutes , through: :employment_detail
end
