ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
 permit_params :email, :password, :password_confirmation

 form do |f|
   f.inputs do
 	 f.semantic_errors *f.object.errors.keys 
       f.input :email 
       f.input :password
        f.input :password_confirmation
     end
       f.actions
 end

# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
