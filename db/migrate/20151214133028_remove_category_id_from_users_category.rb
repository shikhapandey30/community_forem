class RemoveCategoryIdFromUsersCategory < ActiveRecord::Migration
  def change
  	add_column :users_categories ,:category_id, :integer
  end
end
