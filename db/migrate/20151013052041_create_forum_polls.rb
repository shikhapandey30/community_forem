class CreateForumPolls < ActiveRecord::Migration
  def change
    create_table :forum_polls do |t|
      t.integer :category_id
      t.string :topic
      t.text :body
      t.string :visibility
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
