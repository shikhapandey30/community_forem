require "rails_helper"

describe Authenticate do
  describe "belongs to association with user" do
    it { should belong_to(:user) }
  end  
end
