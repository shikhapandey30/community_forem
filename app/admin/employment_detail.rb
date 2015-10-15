ActiveAdmin.register EmploymentDetail do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
 permit_params :user_id,:total_experience,organisations_attributes: [:id, :name, :_destroy,:employment_detail_id,:job_profile,:designation,:start_date,:end_date,:current_company]

# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

form do |f|
 	 f.semantic_errors *f.object.errors.keys
      f.inputs "EmploymentDetail" do 
        f.input :user_id ,as: :select, collection: User.all.map{|u| ["#{u.email}", u.id]}
          f.input :total_experience
      end

        f.has_many :organisations do |institute|
          institute.input :name 
          institute.input :job_profile
          institute.input :designation
          institute.input :start_date, :as => :datepicker
          institute.input :end_date, :as => :datepicker
          institute.input :current_company, :as => :radio, :collection => ["Yes","No"]
      end

      f.actions
    end
end
