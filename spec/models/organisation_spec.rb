require "rails_helper"

describe Organisation do
  describe "Organisation associaties with following models" do
    it "It should belong_to employment_detail" do 
     should belong_to(:employment_detail) 
    end
  end
end