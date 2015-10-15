ActiveAdmin.register EducationHistory do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :user_id,:specialization_id,courses_attributes: [:id, :name, :_destroy,:education_history_id],institutes_attributes: [:id, :name, :_destroy,:education_history_id]
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
      f.inputs "EducationHistory" do 
        f.input :user_id ,as: :select, collection: User.all.map{|u| ["#{u.email}", u.id]}
          f.input :specialization_id ,as: :select, collection: Specialization.all.map{|u| ["#{u.name}", u.id]}
      end

      f.has_many :courses do |course|
        course.input :name,as: :select, collection: Course.all.map{|u| ["#{u.name}", u.name]}.uniq
      end
        f.has_many :institutes do |institute|
          institute.input :name 
          institute.input :passing_year, :as => :datepicker
      end

      f.actions
    end
   # controller do
 #   def permitted_params
 #    params.permit education_history: [:user_id,:specialization_id,courses_attributes: [:id, :name, :_destroy,:education_history_id]]
 #   end
 # end

end
