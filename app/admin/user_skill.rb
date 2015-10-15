ActiveAdmin.register UserSkill do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
permit_params :user_id,skills_attributes: [:id, :name, :_destroy,:user_skill_id]

#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
 form do |f|
 	 f.semantic_errors *f.object.errors.keys
      f.inputs "UserSkill" do 
        f.input :user_id ,as: :select, collection: User.all.map{|u| ["#{u.email}", u.id]}
      end

      f.has_many :skills do |skill|
        skill.input :name
      end
       

      f.actions
    end

end
