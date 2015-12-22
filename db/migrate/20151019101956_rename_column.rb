class RenameColumn < ActiveRecord::Migration
  def change
  		rename_column :posts, :topic, :title
  end
end
