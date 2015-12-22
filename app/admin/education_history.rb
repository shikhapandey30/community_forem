ActiveAdmin.register EducationHistory do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
 permit_params :EducationHistory_id, :user_id, :specialization_id, :course_id, :institute_id, :start_year, :end_year
#:   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
