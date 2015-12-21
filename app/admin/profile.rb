ActiveAdmin.register Profile do
permit_params :first_name, :last_name, :user_id, :gender, :image, :phone_no, :location, :dob, :screen_name, :specialization_id, :street, :post_code, :city, :country, :created_at, :updated_at, :profile_type, :ethnic_group, :state, :address1, :address2
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


end
