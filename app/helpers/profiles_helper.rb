module ProfilesHelper
	def isCategory?(category)
		current_user.users_category.present? && current_user.users_category.category_ids.include?(category.id.to_s)
	end

	def education_path(education_history)
		education_history.id.present? ? edit_education_profiles_path(education_history) : education_profiles_path
	end

	def employment_path(employment_detail)
		employment_detail.id.present? ? edit_employment_profiles_path(employment_detail) : employment_profiles_path
	end

	def country_list		
		Country.all.collect{ |c| [c.name, c.id] }
	end
end
