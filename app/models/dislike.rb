class Dislike < ActiveRecord::Base
	belongs_to :dislikable, :polymorphic => true

		def self.create_like(id, type, current_user)
	    case type
	    when 'post' 
	     @model = Post.find(id)
	    when 'comment'
	    	@model = Comment.find(id)	        
	    when 'meeting_room' 
	    	@model = MeetingRoom.find(id)
	    when 'reply' 
	    	 @model = Reply.find(id)
	    when 'topic'
	    	 @model = Topic.find(id)
	    end
	   dislike =  Dislike.find_or_initialize_by(:dislikable=>@model,:user_id=>current_user.id)
	    if dislike.id.present? 
	   	  dislike.destroy
	   	   return nil, @model
	   	else
	   	  dislike.save 
	   	   like = Like.where(:likable=>@model,:user_id=>current_user.id)
           like.destroy_all
	   	  return dislike, @model
	    end
		end
	
end
