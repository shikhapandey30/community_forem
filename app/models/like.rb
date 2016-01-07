class Like < ActiveRecord::Base

  ## Model Associations
	belongs_to :likable, :polymorphic => true
	
  ## finding like and dislike for different models
  def self.create_like(id, type, current_user)
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
   like =  Like.find_or_initialize_by(:likable=>@model,:user_id=>current_user.id)

    if like.id.present? 
   	  like.destroy
   	  return nil, nil, @model
   	else
   	  like.save 
      dis = Dislike.where(:dislikable=>@model,:user_id=>current_user.id)
      dis.destroy_all
   	  return like,dis, @model
    end
	end
end
