# require 'spec_helper'
require "rails_helper" 
require 'factory_girl_rails'
describe User do
  
  before(:each) do
    @user = FactoryGirl.create(:user)
  end
	
	it "It should have one notification_setting" do 
	 should have_one(:notification_setting).dependent(:destroy)
	end

	it "It should have many posts" do 
	 should have_many(:posts).dependent(:destroy)
	end

	it "It should have many categories" do 
	 should have_many(:categories).dependent(:destroy)
	end

	it "It should have many education_histories" do 
	 should have_many(:education_histories).dependent(:destroy)
	end

	it "It should have many employment_details" do 
	 should have_many(:employment_details).dependent(:destroy)
	end

	it "It should have one profile" do 
	 should have_one(:profile).dependent(:destroy)
	end

	it "It should have many replies" do 
	 should have_many(:replies).dependent(:destroy)
	end

	it "It should have many communities" do 
	 should have_many(:communities).dependent(:destroy)
	end

	it "It should have many groups" do 
	 should have_many(:groups).dependent(:destroy)
	end

	it "It should have many forum_polls" do 
	 should have_many(:forum_polls).dependent(:destroy)
	end

	it "It should have many contests" do 
	 should have_many(:contests).dependent(:destroy)
	end

	it "It should have many meeting_rooms" do 
	 should have_many(:meeting_rooms).dependent(:destroy)
	end

	it "It should have many followings" do 
	 should have_many(:followings).dependent(:destroy)
	end

	it "It should have many followers" do 
	 should have_many(:followers)
	end

	it "It should have many authenticates" do 
	 should have_many(:authenticates)
	end

	it "It should have many friendships" do 
	 should have_many(:friendships)
	end

	it "It should have many friends" do 
	 should have_many(:friends)
	end

	it "It should have many inverse_friendships" do 
	 should have_many(:inverse_friendships).class_name('Friendship')
	end

	it "It should have many inverse_friends" do 
	 should have_many(:inverse_friends)
	end

	it "It should have many sent_notifications" do 
	 should have_many(:sent_notifications).class_name('Notification').with_foreign_key('user_id')
	end

	it "It should have many notifications" do 
	 should have_many(:notifications).class_name('Notification').with_foreign_key('recepient_id')
	end

	it "It should have many members" do 
	 should have_many(:members).dependent(:destroy)
	end

	it "It should have many community_members" do 
	 should have_many(:community_members).through(:members).source(:invitable)
	end

	it "It should have many meeting_rooms_members" do 
	 should have_many(:meeting_rooms_members).through(:members).source(:invitable)
	end

	it "It should have many group_members" do 
	 should have_many(:group_members).through(:members).source(:invitable)
	end

	it "It should have many meeting_rooms" do 
	 should have_many(:meeting_rooms).dependent(:destroy)
	end


	it "It should have many votes" do 
	 should have_many(:votes).dependent(:destroy)
	end

	it "It should have many conversations" do 
	 should have_many(:conversations).with_foreign_key('sender_id')
	end

	it "It should have many reveal_identities" do 
	 should have_many(:reveal_identities).dependent(:destroy).with_foreign_key('sender_id')
	end

	it "It should have many messages" do 
	 should have_many(:messages).dependent(:destroy)
	end

	it "It should have many wallets" do 
	 should have_many(:wallets).dependent(:destroy)
	end

	it "It should have one skill" do 
	 should have_one(:skill)
	end

	it "It should have one users_category" do 
	 should have_one(:users_category).dependent(:destroy)
	end

	## Callback methos
	it "should trigger set_notification_setting on after create" do
	 should callback(:set_notification_setting).after(:create)	 
	end

	## Validation presence_of
	describe "validates_presence_of" do 
	    it "validate_presence_of email, first_name, last_name, screen_name" do
	       should validate_presence_of(:first_name) 
	       should validate_presence_of(:last_name)
	       should validate_presence_of(:screen_name) 
	       should validate_presence_of(:password)              
	    end
    end

    ## Validation uniqeness_of
	describe "validates_uniqeness_of_of" do 
	    it "validate_presence_of , screen_name" do
	       should validate_uniqueness_of(:screen_name) 
	    end
    end

    it 'Check user' do
	  User.all.should eq [@user]
	end

	## Nested Attributes
	it 'accept_nested_attributes_for profile' do
		should accept_nested_attributes_for(:profile)
	end

	it 'accept_nested_attributes_for notification_setting' do
		should accept_nested_attributes_for(:notification_setting)
	end

	## Scopes
	it "should be active with status_id 3" do
	  User.archive.should include(@user)
	end
	
end



