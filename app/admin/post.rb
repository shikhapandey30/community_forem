ActiveAdmin.register Post do
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
  permit_params :user_id, :category_id, :title, :description, :expiration_date, :topic, :start_date, :visibility, upload_attributes: [ :id, :image, :video, :site_link, :file ]
  index do
    selectable_column
    id_column
    column "User" do |post|
    	post.user.try(:first_name)
    end
    column "Category" do |post|
      post.category.try(:name)
    end
    column :title
    column :topic
    column :description
    column "Image" do |post|
      image_tag(post.upload.try(:image_url), :style=>"width: 60px")
    end
    column "Video" do |post|
      post.upload.try(:video)
    end
    column "Site Link" do |post|
      post.upload.try(:site_link)
    end
    column "File" do |post|
      post.upload.try(:file)
    end
    column :start_date
    column :expiration_date
    column :visibility
    actions
  end

  form do |f|
    f.inputs "Post Details" do
      f.input :user_id, as: :select, collection: User.all.collect {|user| [user.first_name, user.id]}
      f.input :category_id, as: :select, collection: Category.all.collect {|category| [category.name, category.id]}
      f.input :title
      f.input :topic
      f.input :description
      f.inputs "Upload" do
        f.has_many :upload do |u|
          u.input :image
          u.input :video
          u.input :site_link
          u.input :file
        end
      end
      f.input :start_date, as: :datepicker, datepicker_options: { changeYear: true, changeMonth: true }
      f.input :expiration_date, as: :datepicker, datepicker_options: { changeYear: true, changeMonth: true }
      f.input :visibility
    end
    f.actions
  end

end
