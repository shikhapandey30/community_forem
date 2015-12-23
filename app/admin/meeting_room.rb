ActiveAdmin.register MeetingRoom do
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
  permit_params :category_id, :topic, :headline, :name, :slogan, :user_id, upload_attributes: [ :id, :image, :video, :site_link, :file ]
  index do
    selectable_column
    id_column
    column "User" do |meeting_room|
    	meeting_room.user.try(:first_name)
    end
    column "Category" do |meeting_room|
    	meeting_room.category.try(:name)
    end
    column :topic
    column :headline
    column :name
    column :slogan
    column "Image" do |meeting_room|
      image_tag(meeting_room.upload.try(:image_url), :style=>"width: 60px")
    end
    column "Video" do |meeting_room|
      meeting_room.upload.try(:video)
    end
    column "Site Link" do |meeting_room|
      meeting_room.upload.try(:site_link)
    end
    column "File" do |meeting_room|
      meeting_room.upload.try(:file)
    end
    actions
  end

  form do |f|
    f.inputs "Meeting Room Details" do
      f.input :user_id, as: :select, collection: User.all.collect {|user| [user.first_name, user.id]}
      f.input :category_id, as: :select, collection: Category.all.collect {|category| [category.name, category.id]}
      f.input :topic
      f.input :headline
      f.input :name
      f.input :slogan
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
