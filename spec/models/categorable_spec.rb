require "rails_helper"

describe Categorable do
  describe "belongs to polymorphic association with category & user" do    
    it "It should belong_to category" do
    	should belong_to(:category)
    end
    it "It should belong_to user" do
    	should belong_to(:user)
    end
  end
end