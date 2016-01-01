require "rails_helper"

describe Comment do
  describe "Comments associaties with following models" do    
    it "It should belong_to user" do
    	should belong_to(:user)
    end
    it "It should belong_to post" do 
    	should belong_to(:post)
    end
    # it { should belong_to(:meeting_room) }
    it "It should belong_to commentable" do 
    	should belong_to(:commentable)
    end
    it "It should has many likes" do 
    	should have_many(:likes).dependent(:destroy)
    end
    it "It should has many dislikes" do 
    	should have_many(:dislikes).dependent(:destroy)
    end
    it "It should has many replies" do 
    	should have_many(:replies).dependent(:destroy)
    end
  end
  ## Validation
  describe "validates_presence_of" do 
    it "validate_presence_of body" do
      should validate_presence_of(:body)
    end
  end
end