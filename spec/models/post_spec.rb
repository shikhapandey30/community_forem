require "rails_helper"

describe Post do
  describe "Post associaties with following models" do
    it "It should belong_to user" do 
     should belong_to(:user) 
    end
    it "It should belong_to category" do 
      should belong_to(:category)
    end
    it "It should belong_to postable" do 
      should belong_to(:postable)
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
    it "It should have one upload" do 
	 should have_one(:upload).dependent(:destroy)
	end
  end
  ## Validation
  describe "validates_presence_of" do 
    it "validate_presence_of topic, category_id, description, title" do
      should validate_presence_of(:topic)
      should validate_presence_of(:category_id) 
      should validate_presence_of(:description) 
      should validate_presence_of(:title)
    end
  end

  ## Nested Attributes
	it 'accept_nested_attributes_for upload' do
		should accept_nested_attributes_for(:upload)
	end
end