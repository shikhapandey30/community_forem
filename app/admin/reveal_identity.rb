ActiveAdmin.register RevealIdentity do
	menu false
permit_params :sender_id, :user_id, :body, :accept, :body2
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
 index do
    selectable_column
    id_column
    column "Sender" do |reveal|
 		link_to reveal.sender.screen_name, admin_user_path(reveal.sender) if reveal.sender.present?
    end

    column "Reciever" do |reveal|
 		link_to reveal.user.screen_name, admin_user_path(reveal.user)    if reveal.user.present?	
    end

    column :accept
    column :body
    column :body2

    actions
  end


end
