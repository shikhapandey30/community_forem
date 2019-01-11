class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.boolean :subscribe
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
