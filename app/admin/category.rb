ActiveAdmin.register Category do
  menu false
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
    column "Image" do |category|
      image_tag(category.try(:image_url), :style=>"width: 60px")
    end
    # column "Icon" do |category|
    #   image_tag(category.try(:icon_url), :style=>"width: 60px")
    # end
    actions
  end

  form do |f|
    f.inputs "Category Details" do
      f.input :name
      f.input :image, as: :file
    end
    f.actions
  end
end
