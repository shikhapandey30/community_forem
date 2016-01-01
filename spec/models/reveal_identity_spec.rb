require "rails_helper"

describe RevealIdentity do
  describe "RevealIdentity associaties with following models" do
    it "It should belong_to user" do 
     should belong_to(:user) 
    end
    it "It should belong_to sender (user)" do 
      should belong_to(:sender).class_name('User').with_foreign_key('sender_id')
    end
    it "It should has many subscriptions" do 
      should have_many(:subscriptions).dependent(:destroy)
    end
  end
end