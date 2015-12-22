class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :category_id
      t.text :topic
      t.text :post_text
      t.string :attachment
      t.string :visibility
      t.datetime :expiration_date

      t.timestamps null: false
    end
  end
end
