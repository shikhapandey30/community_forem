class Following < ActiveRecord::Base
  belongs_to :following
  belongs_to :follower
end
