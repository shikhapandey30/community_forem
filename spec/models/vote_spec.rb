require "rails_helper"

describe Vote do
  describe "Vote associaties with following models" do
    it "It should belong_to vote" do 
      should belong_to(:votable)
    end
    it "It should belong_to user" do 
     should belong_to(:user) 
    end
  end
end