class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.integer :category_id
      t.string :topic
      t.string :headline
      t.text :description
      t.boolean :visibility, :default => true
      t.date :start_date
      t.date :end_date
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
