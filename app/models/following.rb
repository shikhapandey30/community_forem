class Following < ActiveRecord::Base
 belongs_to :followable, polymorphic: true
 belongs_to :follower 
end