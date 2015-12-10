module UsersHelper
	def designation(post)
		post.user.employment_details.collect(&:designation).reject(&:empty?).join(',') rescue "N/A"
	end
end
