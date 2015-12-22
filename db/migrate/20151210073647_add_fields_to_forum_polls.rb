class AddFieldsToForumPolls < ActiveRecord::Migration
  def change
    add_column :forum_polls, :headline, :string
    add_column :forum_polls, :vote_id, :string
  end
end
