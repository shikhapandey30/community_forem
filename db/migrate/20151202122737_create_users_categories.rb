class CreateUsersCategories < ActiveRecord::Migration
  def change
    create_table :users_categories do |t|
      t.integer :user_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
