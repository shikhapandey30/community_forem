ActiveAdmin.register EducationHistory do
menu false
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
#:   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
 permit_params :user_id, :course_id, :institute_id, :specialization_id, :start_year, :end_year
 index do
    selectable_column
    id_column
    column "User" do |education_history|
    	education_history.user.try(:first_name)
    end
    column "Course" do |education_history|
    	education_history.course.try(:name)
    end
    column "Institute" do |education_history|
    	education_history.institute.try(:name)
    end
    column "Specialization" do |education_history|
    	education_history.specialization.try(:name)
    end
    column :start_year
    column :end_year
    actions
  end

  form do |f|
    f.inputs "Education History Details" do
      f.input :user_id, as: :select, collection: User.all.collect {|user| [user.first_name, user.id]}
      f.input :course_id, as: :select, collection: Course.all.collect {|course| [course.name, course.id]}
      f.input :institute_id, as: :select, collection: Institute.all.collect {|institute| [institute.name, institute.id]}
      f.input :specialization_id, as: :select, collection: Specialization.all.collect {|specialization| [specialization.name, specialization.id]}
      f.input :start_year
      f.input :end_year
    end
    f.actions
  end
end
