class CreateInstitutes < ActiveRecord::Migration
  def change
    create_table :institutes do |t|
      t.integer :education_history_id
      t.string :name
      t.date :passing_year

      t.timestamps null: false
    end
  end
end
