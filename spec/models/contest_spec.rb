require "rails_helper"

describe Contest do
  describe "Contest associaties with following models" do
    it "It should belong_to user" do 
     should belong_to(:user) 
    end
    it "It should belong_to category" do 
      should belong_to(:category)
    end
    it "It should has many posts" do 
      should have_many(:posts).dependent(:destroy)
    end
    it "It should has many members" do 
      should have_many(:members).dependent(:destroy)
    end
    it "It should has many likes" do 
      should have_many(:likes).dependent(:destroy)
    end
    it "It should has many dislikes" do 
      should have_many(:dislikes).dependent(:destroy)
    end
    it "It should has many comments" do 
      should have_many(:comments).dependent(:destroy)
    end
    it "It should has many followings" do 
      should have_many(:followings).dependent(:destroy)
    end
    it "It should has many votes" do 
      should have_many(:votes).dependent(:destroy)
    end
    it "It should has one upload" do 
      should have_one(:upload).dependent(:destroy)
    end
  end
  ## Validation
  describe "validates_presence_of" do 
    it "validate_presence_of category_id, topic, headline, visibility, start_date, end_date, description" do
      should validate_presence_of(:category_id)
      should validate_presence_of(:topic) 
      should validate_presence_of(:headline) 
      should validate_presence_of(:visibility)
      should validate_presence_of(:start_date)
      should validate_presence_of(:end_date) 
      should validate_presence_of(:description) 
    end
  end
end