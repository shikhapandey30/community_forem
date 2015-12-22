ActiveAdmin.register EmploymentDetail do
menu false
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
 permit_params :user_id, :total_experience, :designation, :organization, :start_work_date, :worked_till, :description, :current_company
 index do
    selectable_column
    id_column
    column "User" do |employment_detail|
    	employment_detail.user.try(:first_name)
    end
    column :total_experience
    column :designation
    column :organization
    column :start_work_date
    column :worked_till
    column :description
    column :current_company
    actions
  end

  form do |f|
    f.inputs "Employment Details" do
      f.input :user_id, as: :select, collection: User.all.collect {|user| [user.first_name, user.id]}
      f.input :total_experience
      f.input :designation
      f.input :organization
      f.input :start_work_date, as: :datepicker, datepicker_options: { changeYear: true, changeMonth: true }
      f.input :worked_till, as: :datepicker, datepicker_options: { changeYear: true, changeMonth: true }
      f.input :description
      f.input :current_company
    end
    f.actions
  end
end
