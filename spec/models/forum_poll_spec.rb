require "rails_helper"

describe ForumPoll do
  describe "ForumPoll associaties with following models" do    
    it "It should belong_to user" do
      should belong_to(:user)
    end
    it "It should belong_to category" do
      should belong_to(:category)
    end
    it "It should has many votes" do 
      should have_many(:votes).dependent(:destroy)
    end
    it "It should has many upload" do 
      should have_one(:upload).dependent(:destroy)
    end
  end
  ## Validation
  describe "validates_presence_of" do 
    it "validate_presence_of category_id" do
      should validate_presence_of(:category_id)
    end
  end
end