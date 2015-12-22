class CreateAuthenticates < ActiveRecord::Migration
  def change
    create_table :authenticates do |t|
      t.string :uid
      t.string :provider
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
