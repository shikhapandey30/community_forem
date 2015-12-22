ActiveAdmin.register Institute do
# See permitted parameters documentation:
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
  permit_params :name, :passing_year
  index do
    selectable_column
    id_column
    column :name
    column :passing_year
    actions
  end

  form do |f|
    f.inputs "Institute Details" do
      f.input :name
      f.input :passing_year
    end
    f.actions
  end

end
