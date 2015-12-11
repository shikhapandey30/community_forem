class CreateMeetingRooms < ActiveRecord::Migration
  def change
    create_table :meeting_rooms do |t|
      t.string :category_id
      t.string :topic
      t.string :headline
      t.string :name
      t.string :slogan
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
