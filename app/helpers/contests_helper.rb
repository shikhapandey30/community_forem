module ContestsHelper
	def expireDate(expire_date)
		(Time.now>expire_date) ? 'Expired' : distance_of_time_in_words( Time.now,expire_date ) + " rem."
	end
end
