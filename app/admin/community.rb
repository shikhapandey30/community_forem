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
  permit_params :topic, :headline, :slogan, :image, :description, :user_id
  index do
    selectable_column
    id_column
    column :topic
    column :headline
    column :slogan
    column "Image" do |community|
    	image_tag(community.try(:image_url), :style=>"width: 60px")
    end
    column :description
    column "User" do |community|
    	community.user.try(:first_name)
    end
    actions
  end

  form do |f|
    f.inputs "Community Details" do
      f.input :user_id, as: :select, collection: User.all.collect {|user| [user.first_name, user.id]}
      f.input :topic
      f.input :headline
      f.input :slogan
      f.input :image, as: :file
      f.input :description
    end
    f.actions
  end
end
