class RenameColumnCategoryIdsToUserCategory < ActiveRecord::Migration
  def change
  	 remove_column :users_categories, :category_id, :integer
  end
end
