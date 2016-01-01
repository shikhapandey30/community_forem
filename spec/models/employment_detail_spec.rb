require "rails_helper"

describe EmploymentDetail do
  describe "EmploymentDetail associaties with user models" do    
    it "It should belong_to user" do
    	should belong_to(:user)
    end   
  end
end
