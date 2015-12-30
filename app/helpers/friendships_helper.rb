module FriendshipsHelper
	def friendship(friend)
	  Friendship.where("(user_id = ? OR friend_id =?) AND (friend_id = ? OR user_id =?)", current_user, current_user, friend, friend).first.updated_at rescue Date.today
	end
end
