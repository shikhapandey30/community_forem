class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :forum_id
      t.integer :user_id
      t.text :description
      t.string :name

      t.timestamps null: false
    end
  end
end
