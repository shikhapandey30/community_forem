require "rails_helper"

describe Member do
  describe "Member associations" do
    it "It should belong_to user" do
    	should belong_to(:user)
    end
    it "It should belong_to invitable" do
    	should belong_to(:invitable)
    end
  end
end