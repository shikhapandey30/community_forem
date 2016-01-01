require "rails_helper"

describe Profile do
  describe "Profile associaties with following models" do
    it "It should belong_to user" do 
     should belong_to(:user) 
    end
    it "It should belong_to contry" do 
      should belong_to(:contry).class_name('Country').with_foreign_key('country')
    end
  end
end