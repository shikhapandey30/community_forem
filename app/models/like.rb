class Like < ActiveRecord::Base
	belongs_to :likable, :polymorphic => true
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
   like =  Like.find_or_initialize_by(:likable=>@model,:user_id=>current_user.id)

    if like.id.present? 
   	  like.destroy
   	   return nil, @model
   	else
   	  like.save 
       dis = Dislike.where(:dislikable=>@model,:user_id=>current_user.id)
       dis.destroy_all
   	  return like, @model
    end
	end
end
