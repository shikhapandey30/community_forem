class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.integer :employment_detail_id
      t.string :designation
      t.date :start_date
      t.date :end_date
      t.boolean :current_company
      t.string :job_profile

      t.timestamps null: false
    end
  end
end
