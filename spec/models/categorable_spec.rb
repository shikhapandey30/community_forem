require "rails_helper"

describe Categorable do
  describe "belongs to polymorphic associatin with category & user" do    
    it { should belong_to(:category) }
    it { should belong_to(:user) }
  end
end