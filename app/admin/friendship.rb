ActiveAdmin.register Friendship do

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
 permit_params :user_id, :friend_id, :accept
 index do
    selectable_column
    id_column
    column "User" do |friendship|
    	friendship.user.try(:first_name)
    end
    column "Friend" do |friendship|
      friendship.friend.try(:first_name)
    end
    column :accept
    actions
  end
  actions :show, :index
end
