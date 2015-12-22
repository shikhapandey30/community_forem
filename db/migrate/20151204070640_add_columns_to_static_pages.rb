class AddColumnsToStaticPages < ActiveRecord::Migration
  def change
    add_column :static_pages, :contactus, :text
  end
end
