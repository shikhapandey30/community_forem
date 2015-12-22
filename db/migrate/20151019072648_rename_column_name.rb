class RenameColumnName < ActiveRecord::Migration
  def change
  	rename_column :posts, :attachment, :file
  end
end
