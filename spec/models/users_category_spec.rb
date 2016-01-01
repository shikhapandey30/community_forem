require "rails_helper"

describe UsersCategory do
  describe "UsersCategory associaties with following models" do
    it "It should belong_to category" do 
      should belong_to(:category)
    end
    it "It should belong_to user" do 
     should belong_to(:user) 
    end
  end
end