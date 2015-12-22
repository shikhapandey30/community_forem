ActiveAdmin.register Category do
  preserve_default_filters!
  # menu label: 'Caregory'

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
  permit_params :name, :image, :icon
  index do
    selectable_column
    id_column
    column :name
    column :image
    column :icon
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  form do |f|
    f.inputs "Category Details" do
      f.input :name
      f.input :image
      f.input :icon
    end
    f.actions
  end
end
