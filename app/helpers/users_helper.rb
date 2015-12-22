module UsersHelper
	def designation(post)
		post.user.employment_details.collect(&:designation).reject(&:empty?).join(', ') rescue "N/A"
	end

	def designations(user)
		user.employment_details.last.try(:designation) rescue "N/A"
	end

	def follow_status(object)
		status = object.followable.followings.where(follower_id: current_user.id).first 
 		return status.present? ? "Unfollow" : "Follow"
	end

	def user(follower)
		User.find(follower.follower_id)
	end

	def user_path(user)
		# current_user.eql?(user) ? edit_profile_path(user) : 
		profile_path(user)
	end

	def grp_path(group)
		# current_user.eql?(group.user) ? edit_group_path(group) : 
		group_path(group)
	end

	def comm_path(community)		
		# current_user.eql?(community.user) ? edit_community_path(community) : 
		community_path(community)
	end
end
