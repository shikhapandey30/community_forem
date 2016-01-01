require "rails_helper"

describe Category do
  describe "Category association with user, user_category, post & group" do    
    it "It should belong_to user" do
    	should belong_to(:user)
    end
    it "It should has many users_categories" do
    	should have_many(:users_categories).dependent(:destroy)
    end
    it "It should has many posts" do
    	should have_many(:posts).dependent(:destroy)
    end
    it "It should has many groups" do
    	should have_many(:groups).dependent(:destroy)
    end
  end
end