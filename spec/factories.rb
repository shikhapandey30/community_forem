FactoryGirl.define do
	factory :user do |f|
		f.email 'flexsin@ywr.com'
		f.password '12345678'
		f.password_confirmation '12345678'
		f.first_name 'First name'
		f.last_name 'Lasr Name'
		f.screen_name 'Lasr Name'
    end

  #   factory :group do |f|
		# f.topic 'flexsin@ywr.com'
		# f.description 'This is nice group'
		# f.headline '12345678'
		# f.category_id 'First name'
		# f.last_name 'Lasr Name'
		# f.screeen_name 'Lasr Name'
  #   end 
end