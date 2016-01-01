require "rails_helper"

describe Skill do
  describe "Skill associaties with following models" do
    it "It should belong_to user" do 
     should belong_to(:user) 
    end
  end
end