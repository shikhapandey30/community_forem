class RenameColumnInUser < ActiveRecord::Migration
  def change
  	rename_column :users, :specialization, :specialization_id
  end
end
