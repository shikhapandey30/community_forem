class CreateEmploymentDetails < ActiveRecord::Migration
  def change
    create_table :employment_details do |t|
      t.integer :user_id
      t.float :total_experience

      t.timestamps null: false
    end
  end
end
