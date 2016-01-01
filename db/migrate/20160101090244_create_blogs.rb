class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :name
      t.text :description
      t.string :image
      t.integer :user_id
      t.string :slug

      t.timestamps null: false
    end
  end
end
