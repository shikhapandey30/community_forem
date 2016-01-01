require "rails_helper"

describe Category do
  describe "Category associatin with user, user_category, post & group" do    
    it { should belong_to(:user) }
    it { should have_many(:users_categories).dependent(:destroy) }
    it { should have_many(:posts).dependent(:destroy) }
    it { should have_many(:groups).dependent(:destroy) }
  end
end