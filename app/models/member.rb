class Member < ActiveRecord::Base

  ## Model Associations
  belongs_to :user
  belongs_to :invitable, polymorphic: true
  
end
