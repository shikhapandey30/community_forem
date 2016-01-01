require "rails_helper"

describe Community do
  describe "Community associaties with following models" do    
    it "It should belong_to user" do
    	should belong_to(:user)
    end
    it "It should has many posts" do 
    	should have_many(:posts).dependent(:destroy)
    end
    it "It should has many members" do 
    	should have_many(:members).dependent(:destroy)
    end
    it "It should has many upload" do 
    	should have_one(:upload).dependent(:destroy)
    end
  end
  ## Validation
  describe "validates_presence_of" do 
    it "validate_presence_of category_id, topic, headline, description" do
      should validate_presence_of(:category_id)
      should validate_presence_of(:topic) 
      should validate_presence_of(:headline)      
      should validate_presence_of(:description) 
    end
  end
end