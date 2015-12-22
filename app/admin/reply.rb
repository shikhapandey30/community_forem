ActiveAdmin.register Reply do
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
  permit_params :comment_id, :body, :user_id
  index do
    selectable_column
    id_column
    column "User" do |reply|
    	reply.user.try(:first_name)
    end
    column "Comment" do |reply|
    	reply.comment.try(:body)
    end
    column :body
    actions
  end

  form do |f|
    f.inputs "Reply Details" do
      f.input :user_id, as: :select, collection: User.all.collect {|user| [user.first_name, user.id]}
      f.input :comment_id, as: :select, collection: Comment.all.collect {|comment| [comment.body, comment.id]}
      f.input :body
    end
    f.actions
  end

end
