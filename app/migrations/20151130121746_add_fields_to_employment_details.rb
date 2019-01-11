class AddFieldsToEmploymentDetails < ActiveRecord::Migration
  def change
  	add_column :employment_details, :designation, :string
  	add_column :employment_details, :organization, :string
  	add_column :employment_details, :start_work_date, :string
  	add_column :employment_details, :worked_till, :string
  	add_column :employment_details, :description, :text
  end
end
