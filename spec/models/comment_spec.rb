require "rails_helper"

describe Comment do
  describe "Comments associaties with following models" do    
    it { should belong_to(:user) }
    it { should belong_to(:post) }
    # it { should belong_to(:meeting_room) }
    it { should belong_to(:commentable) }
    it { should have_many(:likes).dependent(:destroy) }
    it { should have_many(:dislikes).dependent(:destroy) }
    it { should have_many(:replies).dependent(:destroy) }
  end
end