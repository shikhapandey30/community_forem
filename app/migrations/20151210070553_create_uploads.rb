class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :uploadable_type
      t.integer :uploadable_id
      t.string :image
      t.string :video
      t.string :site_link
      t.string :file	

      t.timestamps null: false
    end
  end
end
