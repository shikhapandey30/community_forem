ActiveAdmin.register Group do
  menu false
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
 permit_params :category_id, :headline, :description, :topic, :user_id, upload_attributes: [ :id, :image, :video, :site_link, :file ]
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
    	image_tag(group.upload.try(:image_url), :style=>"width: 60px")
    end
    column "Video" do |group|
      group.upload.try(:video)
    end
    column "Site Link" do |group|
      group.upload.try(:site_link)
    end
    column "File" do |group|
      group.upload.try(:file)
    end
    actions
  end

  form do |f|
    f.inputs "Group Details" do
      f.input :user_id, as: :select, collection: User.all.collect {|user| [user.first_name, user.id]}
      f.input :category_id, as: :select, collection: Category.all.collect {|category| [category.name, category.id]}
      f.input :topic
      f.input :headline
      f.input :description
      f.inputs "Upload" do
        f.has_many :upload do |u|
          u.input :image
          u.input :video
          u.input :site_link
          u.input :file
        end
      end
    end
    f.actions
  end

end
