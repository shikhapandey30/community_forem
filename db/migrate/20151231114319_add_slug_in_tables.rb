class AddSlugInTables < ActiveRecord::Migration
  def change
  	add_column :posts, :slug, :string
  	add_column :groups, :slug, :string
  	add_column :communities, :slug, :string
  	add_column :contests, :slug, :string
  	add_column :meeting_rooms, :slug, :string
  	add_column :users, :slug, :string
  	add_column :forum_polls, :slug, :string

  	add_index :posts, :slug, :unique => true
  	add_index :groups, :slug, :unique => true
  	add_index :communities, :slug, :unique => true
  	add_index :contests, :slug, :unique => true
  	add_index :meeting_rooms, :slug, :unique => true
  	add_index :users, :slug, :unique => true
  	add_index :forum_polls, :slug, :unique => true
  end
end
