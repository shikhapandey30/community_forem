class CreateRevealIdentities < ActiveRecord::Migration
  def change
    create_table :reveal_identities do |t|
      t.integer :sender_id
      t.integer :user_id
      t.text :body
      t.boolean :accept

      t.timestamps null: false
    end
  end
end
