require "rails_helper"

describe Topic do
  describe "Topic associaties with following models" do
    it "It should belong_to forum" do 
      should belong_to(:forum)
    end
    it "It should belong_to user" do 
     should belong_to(:user) 
    end
    it "It should have many likes" do 
      should have_many(:likes)
    end
    it "It should have many attachments" do 
      should have_many(:attachments).dependent(:destroy)
    end
  end
  ## Validation
  describe "validates_uniqueness_of" do 
    it "validate_uniqueness_of name" do
      should validate_uniqueness_of(:name).allow_blank
    end
  end
end