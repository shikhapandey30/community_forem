namespace :birthday do
    desc "Checking birthday of friends"
    task check_birthday: :environment do
	  	users = User.all
	    users.each do |user|
	    	user.my_friends.each do |friend|
	            if friend.notification_setting.try(:friends_birthday)
		          	if (user.dob.try(:to_date).try(:day) == Date.today.day) && (user.dob.try(:to_date).try(:month) == Date.today.month)
		            	Notification.create(recepient: user, user: friend, body: "#{friend.name } has birhday today")
		            	puts "#{friend.name } has birhday today"
		        	end
	            end
	        end
	    end
    end
end
