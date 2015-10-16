ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
 permit_params :email, :password, :password_confirmation,category_ids: []
#

 form do |f|
   f.inputs do
 	 f.semantic_errors *f.object.errors.keys 
       f.input :email 
       f.input :password
        f.input :password_confirmation
         f.input :categories, :as => :select2_multiple, :collection => Category.all.sort_by(&:name).collect {|p| [ p.name, p.id ] }
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
