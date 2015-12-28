class AddVoteInFavourToVote < ActiveRecord::Migration
  def change
  	add_column :votes, :vote_in_favour, :boolean
  end
end
