ActiveAdmin.register Group do
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
 permit_params :category_id, :headline, :description, :image, :video, :site_link, :file, :topic, :user_id
 index do
    selectable_column
    id_column
    column "User" do |group|
    	group.user.try(:first_name)
    end
    column "Category" do |group|
      group.category.try(:name)
    end
    column :topic
    column :headline
    column :description
    column "Image" do |group|
    	image_tag(group.try(:image_url), :style=>"width: 60px")
    end
    column :video
    column :site_link
    column :file
    actions
  end

  form do |f|
    f.inputs "Group Details" do
      f.input :user_id, as: :select, collection: User.all.collect {|user| [user.first_name, user.id]}
      f.input :category_id, as: :select, collection: Category.all.collect {|category| [category.name, category.id]}
      f.input :topic
      f.input :headline
      f.input :description
      f.input :image, as: :file
      f.input :video, as: :file
      f.input :site_link
      f.input :file, as: :file
    end
    f.actions
  end

end
