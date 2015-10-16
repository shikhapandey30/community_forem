class ForumPoll < ActiveRecord::Base
has_many :votes, :as => :votable
belongs_to :topic
belongs_to :category
 validates_presence_of :topic_id
  validates_presence_of :category_id
end
