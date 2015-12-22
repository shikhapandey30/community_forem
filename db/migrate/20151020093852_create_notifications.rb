class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :notifictaion_type
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
