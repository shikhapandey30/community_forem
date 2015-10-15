ActiveAdmin.register Forum do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :user_id,:description,:name
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
 form do |f|
   f.inputs do
 	 f.semantic_errors *f.object.errors.keys 
       f.input :user_id ,as: :select, collection: User.all.map{|u| ["#{u.email}", u.id]}
       f.input :name
        f.input :description, :input_html => { :class => 'autogrow', :rows => 5, :cols => 30 }
     end
       f.actions
 end

end
