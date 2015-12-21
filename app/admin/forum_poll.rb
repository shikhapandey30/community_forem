ActiveAdmin.register ForumPoll do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
 permit_params  :ForumPoll_id, :category_id, :topic, :body, :visibility, :start_date, :end_date,:topic_id, :attachement, :user_id, :headline, :vote_id
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
