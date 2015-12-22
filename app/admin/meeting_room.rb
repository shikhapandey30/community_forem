ActiveAdmin.register MeetingRoom do
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
  permit_params :category_id, :topic, :headline, :name, :slogan, :user_id
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
    end
    f.actions
  end
end
