class RenameColumnInPosts < ActiveRecord::Migration
  def change
  	change_column :posts, :visibility ,'boolean USING CAST(visibility AS boolean)'
  end
end
