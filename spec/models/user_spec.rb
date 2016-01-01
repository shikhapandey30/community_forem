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

	## Validation
	 describe "validates_presence_of" do 
    it "validate_presence_of email, first_name, last_name, screen_name" do
       should validate_presence_of(:first_name) 
       should validate_presence_of(:last_name)
       should validate_presence_of(:screen_name) 
       should validate_presence_of(:email) 
       should validate_presence_of(:password)              
    end
  end

	# it "It should belongs to account" do 
	#  should belong_to(:account)
	# end

	# it "It should has one partner" do 
	#  should have_one(:partner)
	# end

	# it "It should belong to fitnesslevel" do 
	#  should belong_to(:fitnesslevel)
	# end

	# it "It should belong to healthybacklevel" do 
	#  should belong_to(:healthybacklevel)
	# end

	# it "It should belong to mobileprovider" do 
	#  should belong_to(:mobileprovider)
	# end

	# it "It should belong to siteterm" do 
	#  should belong_to(:siteterm)
	# end

	# it "It should belong to sittinglevel" do 
	#  should belong_to(:sittinglevel)
	# end

	# it "It should belong to sleepinglevel" do 
	#  should belong_to(:sleepinglevel)
	# end

	# it "It should belong to userlevel" do 
	#  should belong_to(:userlevel)
	# end

	# it "It should belong to activation_code" do 
	#  should belong_to(:activation_code)
	# end

	# it "It should belong to discount" do 
	#  should belong_to(:discount)
	# end

	# it "It should has many daily_reminders" do 
	#  should have_many(:daily_reminders)
	# end


	# it "It should has many custom_progs" do 
	#  should have_many(:custom_progs)
	# end
    
 #    it "It should has one dfl_challenge" do 
	#  should have_one(:dfl_challenge)
	# end

	# it "It should has many personal_journals" do 
	#  should have_many(:personal_journals)
	# end
	# it "It should has many personal_measurements" do 
	#  should have_many(:personal_measurements)
	# end

	# it "It should has many diagnoses" do 
	#  should have_many(:diagnoses).dependent(:destroy)
	# end

	# it "It should has many conditions" do 
	#  should have_many(:conditions)
	# end
	
 #    it "It should has many usergoals" do 
	#  should have_many(:usergoals).dependent(:destroy)
	# end   

	#  it "It should has many userbundles" do 
	#  should have_many(:userbundles).dependent(:destroy)
	# end

	# it "It should has many bundles" do 
	#  should have_many(:bundles)
	# end

	# it "It should has many userprogs" do 
	#  should have_many(:userprogs).dependent(:destroy)
	# end

	# it "It should has many progs" do 
	#  should have_many(:progs)
	# end
 #    it "It should has many userworkouts" do 
	#  should have_many(:userworkouts).dependent(:destroy)
	# end
	# it "It should has many workouts" do 
	#  should have_many(:workouts)
	# end

	# it "It should has many subscriptions" do 
	#  should have_many(:subscriptions)
	# end	

	# it "It should has many paymethods" do 
	#  should have_many(:paymethods)
	# end

	# it "It should has many useroauths" do 
	#  should have_many(:useroauths)
	# end

	# it "It should has many oauths" do 
	#  should have_many(:oauths)
	# end

 #    it "It should has many userlogins" do 
	#  should have_many(:userlogins)
	# end

 #     it "It should has many userworkoutevents" do 
	#  should have_many(:userworkoutevents)
	# end

	# it "should trigger create_usersetting on after create" do
	#  should callback(:create_usersetting).after(:create)	 
	# end

	#  it  "should trigger create_initial_diagnoses on after create" do 
	#   is_expected.to callback(:create_initial_diagnoses).after(:create) 
	# end

	# it  "should trigger delete_user_information on before destroy" do 
	#   is_expected.to callback(:delete_user_information).before(:destroy) 
	# end

	# it 'Check user' do
	#   User.all.should eq [@user]
	# end

	#   describe "Scopes" do 
 #      it "should be active with status_id 3" do
 #      User.active.should include(@user)
 #      end

 #      it "should not be suspended without status_id 4" do
 #          User.suspended.should_not include(@user)
 #      end

 #      it "should not be inactive without status_id 5" do
 #          User.inactive.should_not include(@user)
 #      end

 #      it "should not be hidden without status_id 6" do
 #          User.hidden.should_not include(@user)
 #      end

 #      it "should not be deleted without status_id 7" do
 #          User.deleted.should_not include(@user)
 #      end
  # end
end



