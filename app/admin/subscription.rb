ActiveAdmin.register Subscription do
  menu false
#See permitted parameters documentation:
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
permit_params :subscribe, :user_id
  index do
    selectable_column
    id_column
    column "User" do |subscription|
    	subscription.user.try(:screen_name)
    end
    column "Payer" do |subscription|
      subscription.payer.try(:screen_name)
    end
    column :created_at
    actions
  end

  form do |f|
    f.inputs "Subscription Detail" do
      f.input :user_id, as: :select, collection: User.all.collect {|user| [user.first_name, user.id]}
      f.input :subscribe
    end
    f.actions
  end
end
