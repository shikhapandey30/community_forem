ActiveAdmin.register UsersCategory do
  menu false
#: See permitted parameters documentation:
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
permit_params :user_id, :category_id
# , :category_ids
  index do
    selectable_column
    id_column
    column "User" do |users_category|
    	users_category.user.try(:first_name)
    end
    column "Category" do |users_category|
    	users_category.category.try(:name)
    end
    actions
  end

  form do |f|
    f.inputs "Contest Details" do
      f.input :user_id, as: :select, collection: User.all.collect {|user| [user.first_name, user.id]}
      f.input :category_id, as: :select, collection: Category.all.collect {|category| [category.name, category.id]}
    end
    f.actions
  end

end
