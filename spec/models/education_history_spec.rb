require "rails_helper"

describe Following do
  describe "Following associaties with following models" do    
    it "It should belong_to followable" do 
    	should belong_to(:followable)
    end

    it "It should belong_to follower" do 
    	should belong_to(:follower)
    end
  end
end