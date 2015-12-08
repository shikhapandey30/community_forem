module ProfilesHelper
	def isCategory?(category)
		current_user.users_category.present? && current_user.users_category.category_ids.include?(category.id.to_s)
	end
end
