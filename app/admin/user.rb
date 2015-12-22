ActiveAdmin.register User do
#: See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
  permit_params :email, :name, :screen_name, :first_name, :last_name
  index do
    selectable_column
    id_column
    column :email
    column :name
    column :screen_name
    column :first_name
    column :last_name
    actions
  end

  form do |f|
    f.inputs "Meeting Room Details" do
      f.input :email
      f.input :name
      f.input :screen_name
      f.input :first_name
      f.input :last_name
    end
    f.actions
  end

end
