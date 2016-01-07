class Dislike < ActiveRecord::Base

	## Model Associations
	belongs_to :dislikable, :polymorphic => true

	## finding like and dislike for different models
	def self.create_like(id, type, current_user, body)
    case type
    when 'post' 
     @model = Post.find(id)
    when 'comment'
    	@model = Comment.find(id)	        
    when 'meetingroom' 
    	@model = MeetingRoom.find(id)
    when 'reply' 
    	 @model = Reply.find(id)
    when 'topic'
    	 @model = Topic.find(id)
    when 'contest'
       @model = Contest.find(id)
    when 'group'
       @model = Group.find(id)
    when 'community'
       @model = Community.find(id)
    when 'forumpoll'
      @model = ForumPoll.find(id)
    end
   dislike =  Dislike.find_or_initialize_by(:dislikable=>@model,:user_id=>current_user.id)
    if dislike.id.present? 
   	  dislike.destroy
   	  return nil,nil, @model
   	else
   	  dislike.body = body
   	  dislike.save 
   	  like = Like.where(:likable=>@model,:user_id=>current_user.id)
      like.destroy_all
   	  return dislike,like, @model
    end
	end
	
end
