class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :category_id
      t.integer :topic_id
      t.string :headline
      t.text :description
      t.string :image
      t.string :video
      t.string :site_link
      t.string :file
      t.string :topic

      t.timestamps null: false
    end
  end
end
