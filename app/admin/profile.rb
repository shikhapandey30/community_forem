ActiveAdmin.register Profile do
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
  permit_params :first_name, :last_name, :user_id, :gender, :image, :phone_no, :location, :dob, :screen_name, :specialization_id, :street, :post_code, :city, :country, :created_at, :updated_at, :profile_type, :ethnic_group, :state, :address1, :address2
  index do
    selectable_column
    id_column
    column "User email" do |profile|
    	profile.user.try(:email)
    end
    column :first_name
    column :last_name
    column :gender
    column :image
    column :phone_no
    column :location
    column :dob
    column :screen_name
    column :specialization_id
    column :street
    column :post_code
    column :city
    column :country
    column :profile_type
    column :ethnic_group
    column :state
    column :address1
    column :address2
    actions
  end

  form do |f|
    f.inputs "Course Details" do
      f.input :user_id, as: :select, collection: User.all.collect {|user| [user.email, user.id]}
      f.input :first_name
      f.input :last_name
      f.input :gender
      f.input :image
      f.input :phone_no
      f.input :location
      f.input :dob, as: :datepicker, datepicker_options: { changeYear: true, changeMonth: true }
      f.input :screen_name
      f.input :specialization_id, as: :select, collection: Specialization.all.collect {|specialization| [specialization.name, specialization.id]}
      f.input :street
      f.input :post_code
      f.input :city
      f.input :country
      f.input :profile_type
      f.input :ethnic_group
      f.input :state
      f.input :address1
      f.input :address2
    end
    f.actions
  end

end
