class CreateEducationHistories < ActiveRecord::Migration
  def change
    create_table :education_histories do |t|
      t.integer :user_id
      t.integer :specialization_id

      t.timestamps null: false
    end
  end
end
