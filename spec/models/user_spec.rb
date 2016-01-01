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

end



