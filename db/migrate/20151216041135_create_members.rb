class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :user_id
      t.integer :invitable_id
      t.string :invitable_type
      t.boolean :accept, :default => false

      t.timestamps null: false
    end
  end
end
