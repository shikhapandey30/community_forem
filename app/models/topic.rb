class Topic < ActiveRecord::Base
	 belongs_to :forum
	 has_many :forum_polls
     has_many :posts, :dependent => :destroy
end
