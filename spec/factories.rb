FactoryGirl.define do
	factory :user do |f|
		f.email 'flexsin@ywr.com'
		f.password '12345678'
		f.password_confirmation '12345678'
		f.first_name 'First name'
		f.last_name 'Lasr Name'
		f.screen_name 'Lasr Name'
		f.archive true
    end

    factory :notification_setting do |f|
		f.new_update true
		f.friend_request true
		f.comments_and_like true
		f.friends_birthday true
		association :user, :factory => :user	
    end

    factory :posts do |f|
		f.title true
		association :user, :factory => :user
    end 
end