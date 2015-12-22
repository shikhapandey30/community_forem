class CreateCategorables < ActiveRecord::Migration
  def change
    create_table :categorables do |t|
      t.integer :categorable_id
      t.string :categorable_type
      t.integer :user_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
