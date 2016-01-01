require "rails_helper"

describe EducationHistory do
  describe "EducationHistory associaties with following models" do
    it "It should belong_to course" do 
    	should belong_to(:course)
    end
    it "It should belong_to institute" do 
    	should belong_to(:institute)
    end

    it "It should belong_to specialization" do 
    	should belong_to(:specialization)
    end

    it "It should belong_to user" do 
    	should belong_to(:user)
    end
  end
end