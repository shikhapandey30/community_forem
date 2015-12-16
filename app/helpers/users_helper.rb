module UsersHelper
	def designation(post)
		post.user.employment_details.collect(&:designation).reject(&:empty?).join(', ') rescue "N/A"
	end

	def designations(user)
		user.employment_details.last.try(:designation) rescue "N/A"
	end

	def follow_status(post)
		status = post.followings.where(follower_id: current_user.id).first 
 		return status.present? ? "Unfollow" : "Follow"
	end

	def user(follower)
		User.find(follower.follower_id)
	end

	def user_path(user)
		current_user.eql?(user) ? edit_profile_path(user) : profile_path(user)
	end
end
