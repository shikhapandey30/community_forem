require 'faker'

FactoryGirl.define do

    factory :blog do
	    name "MyString"
		description "MyText"
		image "MyString"
		user_id 1
	    slug "MyString"
	end

	factory :user do |f|
		f.email Faker::Internet.email
		f.password '12345678'
		f.password_confirmation '12345678'
		f.first_name 'First name'
		f.last_name 'Lasr Name'
		f.screen_name Faker::Internet.user_name
		f.archive true
    end

    factory :notification_setting do |f|
		f.new_update true
		f.friend_request true
		f.comments_and_like true
		f.friends_birthday true
		association :user, :factory => :user	
    end

    factory :post do |f|
		f.title true
		association :user, :factory => :user
    end

    factory :group do |f|
		f.topic 'group title'
		f.headline 'group titheadlinele'
		f.description 'group description'
		f.category_id 1		
		f.user User.last
    end   

    factory :community do |f|
		f.topic 'group title'
		f.headline 'group titheadlinele'
		f.description 'group description'
		f.category_id 1
		f.user_id 2
    end  

    factory :contest do |f|
		f.topic 'contest title'
		f.headline 'contest titheadlinele'
		f.description 'contest description'
		f.start_date '2016-01-12'
		f.end_date '2017-01-12'
		f.category_id 1
		f.user_id 2
    end

    factory :forum_poll do |f|
		f.topic 'forum_poll title'
		f.headline 'forum_poll titheadlinele'
		f.body 'forum_poll description'
		f.category_id 1
		f.user_id 2
    end

    factory :meeting_room do |f|
		f.topic 'meeting_room title'
		f.headline 'meeting_room titheadlinele'
		f.name 'meeting_room name'
		f.slogan 'meeting_room slogan'
		f.category_id 1
		f.user_id 2
    end

end