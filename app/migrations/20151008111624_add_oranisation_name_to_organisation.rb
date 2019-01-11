class AddOranisationNameToOrganisation < ActiveRecord::Migration
  def change
  	 add_column :organisations, :name, :string
  end
end
