class AddFieldsToProfile < ActiveRecord::Migration
  def change
  	add_column :profiles, :profile_type, :string
  	add_column :profiles, :ethnic_group, :string
  end
end
