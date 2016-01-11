module PostsHelper
	def change_post_path(post)
		case post.postable_type
		when "Group"
			edit_group_path(id: post.postable, post_id: post)
		when "Community"
			edit_community_path(id: post.postable, post_id: post)
		else
			edit_post_path(post)
		end

	end

	def change_model_path(post)
		case post.class.name
		when "Group"
			edit_group_path(post)
		when "Community"
			edit_community_path(post)
		when "Contest"
			edit_contest_path(post)
		when "MeetingRoom"
			edit_meeting_room_path(post)
		when "ForumPoll"
			edit_forum_poll_path(post)
		else
			edit_post_path(post)
		end
	end

	def show_model_path(post)
		case post.class.name
		when "Group"
			group_path(post)
		when "Community"
			community_path(post)
		when "Contest"
			contest_path(post)
		when "MeetingRoom"
			meeting_room_path(post)
		when "ForumPoll"
			forum_poll_path(post)
		else
			post_path(post)
		end
	end

	def rating(post)		
		range = (5*post.likes.count)/(post.likes.count + post.dislikes.count) rescue 0
		# case range
		if range.between?(0, 10)
			return "week"
		elsif range.between?(11, 30)
			return "medium"
		elsif range.between?(31, 50)
			return "good"
		elsif range.between?(51, 70)
			return "strong"
		elsif range.between?(70, 100)
			return "excellent"
		else
			return "week"
		end
	end

	def postExist?(post)
	 	post.class.name=="Post"
	end 
end