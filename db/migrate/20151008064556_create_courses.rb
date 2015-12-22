class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :education_history_id
      t.string :name

      t.timestamps null: false
    end
  end
end
