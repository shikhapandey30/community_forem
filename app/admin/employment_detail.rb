ActiveAdmin.register EmploymentDetail do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :EmploymentDetail_id, :user_id, :total_experience, :designation, :organization, :start_work_date, :worked_till, :description, :current_company
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
