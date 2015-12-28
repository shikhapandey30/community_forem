module PostsHelper
	def change_post_path(post)
		case post.postable_type
		when "Group"
			group_path(id: post.postable, post_id: post)
		when "Community"
			community_path(id: post.postable, post_id: post)
		else
			edit_post_path(post)
		end
		
	end
end
