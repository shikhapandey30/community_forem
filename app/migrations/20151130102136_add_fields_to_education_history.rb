class AddFieldsToEducationHistory < ActiveRecord::Migration
  def change
  	add_column :education_histories, :course_id, :integer
  	add_column :education_histories, :institute_id, :integer
  	add_column :education_histories, :start_year, :date
  	add_column :education_histories, :end_year, :date
  end
end
