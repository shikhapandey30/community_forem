ActiveAdmin.register Topic do
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
permit_params :forum_id, :user_id, :description, :name, :file
# , :category_id
index do
    selectable_column
    id_column
    column "User" do |topic|
    	topic.user.try(:first_name)
    end
    column "Forum" do |topic|
    	topic.forum.try(:name)
    end
    # column "Category" do |topic|
    # 	topic.category.try(:name)
    # end
    column :name
    column :description
    column :file
    actions
  end

  form do |f|
    f.inputs "Education History Details" do
      f.input :user_id, as: :select, collection: User.all.collect {|user| [user.first_name, user.id]}
      f.input :forum_id, as: :select, collection: Forum.all.collect {|forum| [forum.name, forum.id]}
      # f.input :category_id, as: :select, collection: Category.all.collect {|category| [category.name, category.id]}
      f.input :name
      f.input :description
      f.input :file, as: :file
    end
    f.actions
  end
end
