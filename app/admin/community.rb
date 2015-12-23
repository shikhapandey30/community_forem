ActiveAdmin.register Community do
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
  permit_params :topic, :headline, :slogan, :description, :user_id, upload_attributes: [ :id, :image, :video, :site_link, :file ]
  index do
    selectable_column
    id_column
    column :topic
    column :headline
    column :slogan
    column "User" do |community|
    	community.user.try(:first_name)
    end
    column :description
    column "Image" do |community|
      image_tag(community.upload.try(:image_url), :style=>"width: 60px")
    end
    column "Video" do |community|
      community.upload.try(:video)
    end
    column "Site Link" do |community|
      community.upload.try(:site_link)
    end
    column "File" do |community|
      community.upload.try(:file)
    end
    actions
  end

  form do |f|
    f.inputs "Community Details" do
      f.input :user_id, as: :select, collection: User.all.collect {|user| [user.first_name, user.id]}
      f.input :topic
      f.input :headline
      f.input :slogan
      f.inputs "Upload" do
        f.has_many :upload do |u|
          u.input :image
          u.input :video
          u.input :site_link
          u.input :file
        end
      end
      f.input :description
    end
    f.actions
  end
end
