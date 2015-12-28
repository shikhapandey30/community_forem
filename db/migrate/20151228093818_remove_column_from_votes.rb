class RemoveColumnFromVotes < ActiveRecord::Migration
  def change
  	remove_column :votes, :vote_in_favour
  	add_column :votes, :status, :string
  end
end
