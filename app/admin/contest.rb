ActiveAdmin.register Contest do
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
  permit_params  :user_id, :category_id, :topic, :headline, :description, :visibility, :start_date, :end_date
  index do
    selectable_column
    id_column
    column "User" do |community|
    	community.user.try(:first_name)
    end
    column "Category" do |community|
    	community.category.try(:name)
    end
    column :topic
    column :headline
    column :description
    column :visibility
    column :start_date
    column :end_date
    actions
  end

  form do |f|
    f.inputs "Contest Details" do
      f.input :user_id, as: :select, collection: User.all.collect {|user| [user.first_name, user.id]}
      f.input :category_id, as: :select, collection: Category.all.collect {|category| [category.name, category.id]}
      f.input :topic
      f.input :headline
      f.input :description
      f.input :visibility
      f.input :start_date, as: :datepicker, datepicker_options: { changeYear: true, changeMonth: true }
      f.input :end_date, as: :datepicker, datepicker_options: { changeYear: true, changeMonth: true }
    end
    f.actions
  end
end
