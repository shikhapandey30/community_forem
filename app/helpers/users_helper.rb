module UsersHelper
	def designation(post)
		post.user.employment_details.collect(&:designation).reject(&:empty?).join(',') rescue "N/A"
	end

	def follow_status(post)
		status = post.followings.where(follower_id: current_user.id).first 
 		return status.present? ? "Unfollow" : "Follow"
	end
end
