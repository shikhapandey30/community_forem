class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.integer :user_id
      t.string :gender
      t.string :image
      t.string :phone_no
      t.string :location
      t.date :dob
      t.string :screen_name
      t.integer :specialization_id
      t.string :street
      t.string :post_code
      t.string :city
      t.string :country

      t.timestamps null: false
    end
  end
end
