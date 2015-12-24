class ChangeEducationHistoryColumnType < ActiveRecord::Migration
  def change
  	remove_column :education_histories, :start_year
  	remove_column :education_histories, :end_year

  	add_column :education_histories, :start_year, :integer
  	add_column :education_histories, :end_year, :integer
  end
end
