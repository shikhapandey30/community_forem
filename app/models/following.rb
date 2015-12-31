class Following < ActiveRecord::Base

	## Model Associations
	belongs_to :followable, polymorphic: true
	belongs_to :follower, class_name: "User", foreign_key: :follower_id

	## Search by follower screen name
	def self.search(search)
	  if search
	    where('screen_name LIKE ?', "%#{search}%")
	  else
	    all
	  end
	end
end