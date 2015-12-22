ActiveAdmin.register Forum do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
 permit_params :user_id, :name, :description
 index do
    selectable_column
    id_column
    column "User" do |forum|
    	forum.user.try(:first_name)
    end
    column :name
    column :description
    actions
  end

  form do |f|
    f.inputs "Forum Details" do
      f.input :user_id, as: :select, collection: User.all.collect {|user| [user.first_name, user.id]}
      f.input :name
      f.input :description
    end
    f.actions
  end
end
