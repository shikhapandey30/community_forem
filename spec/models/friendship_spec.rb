require "rails_helper"

describe Friendship do
  describe "Friendship associaties with following models" do    
    it "It should belong_to user" do
      should belong_to(:user)
    end
    it "It should belong_to friend" do
      should belong_to(:friend)
    end
  end
end