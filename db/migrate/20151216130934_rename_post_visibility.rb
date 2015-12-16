class RenamePostVisibility < ActiveRecord::Migration
  def change
  	remove_column :posts, :visibility 
  	add_column :posts, :visibility ,:boolean, :default => true
  end
end
