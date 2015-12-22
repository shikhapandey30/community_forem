class CreateStaticPages < ActiveRecord::Migration
  def change
    create_table :static_pages do |t|
      t.text :help_center
      t.text :terms_and_conditions
      t.text :privacy_policy
      t.text :how_it_work
      t.string :facebook_link
      t.string :twitter_link
      t.string :google_link
      t.text :about_us

      t.timestamps null: false
    end
  end
end
