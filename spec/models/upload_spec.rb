require "rails_helper"

describe Upload do
  describe "Upload associaties with following models" do
    it "It should belong_to upload" do 
      should belong_to(:uploadable)
    end
  end
end