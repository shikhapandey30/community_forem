class AddCategoryIdsToUserCtaegoty < ActiveRecord::Migration
  def change
  	 add_column :users_categories, :category_ids, :string
  end
end
