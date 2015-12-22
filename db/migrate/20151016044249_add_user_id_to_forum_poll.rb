class AddUserIdToForumPoll < ActiveRecord::Migration
  def change
  	add_column :forum_polls, :user_id, :integer
  end
end
