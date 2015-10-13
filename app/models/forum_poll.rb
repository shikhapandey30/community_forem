class ForumPoll < ActiveRecord::Base
has_many :votes, :as => :votable
belongs_to :topic
belongs_to :category
end
