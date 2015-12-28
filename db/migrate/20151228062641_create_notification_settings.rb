class CreateNotificationSettings < ActiveRecord::Migration
  def change
    create_table :notification_settings do |t|
      t.integer :user_id
      t.boolean :new_update
      t.boolean :friend_request
      t.boolean :is_new_record
      t.boolean :comments_and_like
      t.boolean :friends_birthday

      t.timestamps null: false
    end
  end
end
