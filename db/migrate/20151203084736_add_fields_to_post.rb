class AddFieldsToPost < ActiveRecord::Migration
  def change
  	add_column 		:posts, :image, :string
  	add_column 		:posts, :video, :string
  	add_column 		:posts, :site_link, :string
  	add_column 		:posts, :topic, :string
  	add_column 		:posts, :start_date, :date
  	remove_column   :posts, :slug
  	rename_column 	:posts, :post_text, :description
  	change_column 	:posts, :visibility, :boolean, :default => true
  end
end
