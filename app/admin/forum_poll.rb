ActiveAdmin.register ForumPoll do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :category_id, :body, :start_date, :end_date,:topic_id,:attachement,:visibility
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
        f.input :category_id ,as: :select, collection: Category.all.map{|u| ["#{u.name}", u.id]}
        f.input :topic_id ,as: :select, collection: Topic.all.map{|u| ["#{u.name}", u.id]}
        f.input :body
        f.input :visibility, :as => :select, :collection => [ 'Public', 'Private','Just For My Network','Just For My Connection','Just For My Community', 'Other' ]
        f.input :attachement,:as=>:file
        f.input :start_date, :as => :datepicker
        f.input :end_date, :as => :datepicker
       

       end
       f.actions
   end

end
