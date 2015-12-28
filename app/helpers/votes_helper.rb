module VotesHelper
	def	vote_status(user,model)
		user.votes.my_vote(model).try(:status)=='for' ? '0 0' : user.votes.my_vote(model).try(:status)=='against' ? '-22px 0' : '-44px 0'
	end	
end
