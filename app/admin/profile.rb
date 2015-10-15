ActiveAdmin.register Profile do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :user_id, :first_name, :last_name, :gender, :image,:phone_no,:location,:dob,:screen_name,:street,:post_code,:city,:country,:profile_type,:ethnic_group
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
 form do |f|
 	 f.semantic_errors *f.object.errors.keys
      f.inputs  do 
        f.input :user_id ,as: :select, collection: User.all.map{|u| ["#{u.email}", u.id]}
        f.input :first_name
        f.input :last_name
        f.input :gender, :as => :select, :collection => ["Male","Female","Other"]
        f.input :image,:as=>:file
        f.input :phone_no
        f.input :location
        f.input :dob, :as => :datepicker
        f.input :screen_name
        f.input :street
        f.input :post_code
        f.input :city
        f.input :country
        f.input :profile_type, :as => :select, :collection => ["Individual","Company"]
        f.input :ethnic_group, :as => :radio, :collection => ["Black","white"]

       end
       f.actions
   end

end
