class AddFieldsToModels < ActiveRecord::Migration
  def change
  	add_column :forums, :description, :string
    add_column :forum_polls, :topic_id, :integer
    add_column :forum_polls,:attachement,:string
  end
end
