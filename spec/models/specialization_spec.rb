require "rails_helper"

describe Specialization do
  describe "Specialization associaties with following models" do
    it "It should have many education_histories" do 
     should have_many(:education_histories) 
    end
  end
end