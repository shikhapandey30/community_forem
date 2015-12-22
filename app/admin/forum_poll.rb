ActiveAdmin.register ForumPoll do
menu false
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
 permit_params  :user_id, :category_id, :topic, :body, :visibility, :start_date, :end_date, :attachement, :headline
 index do
    selectable_column
    id_column
    column "User" do |form_poll|
    	form_poll.user.try(:first_name)
    end
    column "Category" do |form_poll|
      form_poll.category.try(:name)
    end
    column :topic
    column :headline
    column :body
    column :visibility
    column :start_date
    column :end_date
    column :attachement
    actions
  end

  form do |f|
    f.inputs "ForumPoll Details" do
      f.input :user_id, as: :select, collection: User.all.collect {|user| [user.first_name, user.id]}
      f.input :category_id, as: :select, collection: Category.all.collect {|category| [category.name, category.id]}
      f.input :topic
      f.input :headline
      f.input :body
      f.input :visibility
      f.input :start_date, as: :datepicker, datepicker_options: { changeYear: true, changeMonth: true }
      f.input :end_date, as: :datepicker, datepicker_options: { changeYear: true, changeMonth: true }
      f.input :attachement, as: :file
    end
    f.actions
  end
end
