require "rails_helper"

describe Authenticate do
  describe "belongs to associatin with user" do
    it { should belong_to(:user) }
  end  
end
