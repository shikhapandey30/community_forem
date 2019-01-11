class AddFileToTopics < ActiveRecord::Migration
  def change
   add_column :topics, :file, :string
  end
end
