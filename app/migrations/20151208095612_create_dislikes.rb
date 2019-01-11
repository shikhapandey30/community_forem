class CreateDislikes < ActiveRecord::Migration
  def change
    create_table :dislikes do |t|
      t.integer :user_id
      t.integer :dislikable_id
      t.string :dislikable_type

      t.timestamps null: false
    end
  end
end
