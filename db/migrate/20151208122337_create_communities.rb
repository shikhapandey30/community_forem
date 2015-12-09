class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.integer :category_id
      t.string :topic
      t.string :headline
      t.string :slogan
      t.string :image
      t.text :description
      t.integer :topic_id

      t.timestamps null: false
    end
  end
end
